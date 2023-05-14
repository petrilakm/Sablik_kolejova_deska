/* ========================================================================== */
/*                                                                            */
/*   DCC.h                                                                    */
/*   (c) 2015 Michal Petrilak                                                 */
/*                                                                            */
/*   DCC parser - user functions                                              */
/*                                                                            */
/*   libraly for inputs debounce and hold for specific time                   */
/*                                                                            */
/* ========================================================================== */

#include <avr/io.h>
#include "common_defs.h"
#include "defines.h"
#include "sSPI.h"
#include "inputs.h"

byte inp         [3] = {0,0,0}; // input states for program
byte inp_real    [3] = {0,0,0}; // real states, for debounce
//byte inp_shadow  [3] = {0,0,0};                               // shadow of inp, for calculation
byte outp        [64]; // output states for program
//#define outp_shadow HCdataout
byte inp_last    [3] = {0,0,0}; // last button state, for event generation
byte inp_event_1 [3] = {0,0,0}; // only changed from last time to active state (button pressed)
byte inp_event_0 [3] = {0,0,0}; // only changed from last time to default state
byte inp_cnt [20] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}; // for debounce - all inputs
void (*pgenerate_events)(void) = 0; // function pointer for callback function GenerateEvents
byte io_flag_10Hz = 0; // private
byte io_blink_10Hz = 1; // public
byte io_blink_2Hz = 1; // public
byte io_blink_10Hz_cnt = 0; // private
byte io_blink_2Hz_cnt = 0; // private

//----------------------------------------------------
static inline void io_out_set(byte seg, byte bit)
{
  HCdataout[seg] |= (1 << bit);
}

//----------------------------------------------------
static inline void io_out_unset(byte seg, byte bit)
{
  HCdataout[seg] &= ~(1 << bit);
}

/*
void dbg_show_byte(byte num)
{
if (num & 0x01) PORTA |= BV(2); else PORTA &= ~BV(2);
if (num & 0x02) PORTF |= BV(6); else PORTF &= ~BV(6);
if (num & 0x04) PORTC |= BV(7); else PORTC &= ~BV(7);
if (num & 0x08) PORTA |= BV(7); else PORTA &= ~BV(7);
if (num & 0x10) PORTC |= BV(5); else PORTC &= ~BV(5);
if (num & 0x20) PORTC |= BV(4); else PORTC &= ~BV(4);
if (num & 0x40) PORTG |= BV(1); else PORTG &= ~BV(1);
if (num & 0x80) PORTC |= BV(0); else PORTC &= ~BV(0);
}
*/

byte dbg_outs[8] = {16,19,17,18,46,45,47,48};

void dbg_show_byte(byte val)
{
  byte i;
  byte num;
  byte pt_seg, pt_b;
  
  for(i=0; i<8; i++) {
    num = dbg_outs[i];
    pt_seg = (num >> 3);     // byte pointer
    pt_b   = 7-(num & 0x07); // bit pointer
    if (val & (1 << i)) {
      io_out_set(pt_seg, pt_b);
    } else {
      io_out_unset(pt_seg, pt_b);
    }
      
  }
}

//----------------------------------------------------
void io_init(void)
{
  // pullups
  PORTB = 0b00000000;
  PORTC = 0b00011000;
  PORTD = 0b00000000;
  
  // smìry pinù
  DDRB = 0b00001000;
  DDRC = 0b00111010; // SPI
  DDRD = 0b00000100; // serial
  
  outp[0] = 0;
  outp[1] = 0;
  outp[2] = 0;
  outp[3] = 0;
  outp[4] = 0;
  outp[5] = 0;
  
  // MOSI
  // MISO
  // SCK
  // LOAD
  // STORE
}

//----------------------------------------------------
byte io_get_state(byte num)
{
  byte pt_seg, pt_b;

  pt_seg = num >> 3;   // byte pointer
  pt_b   = num & 0x07; // bit  pointer

  return ((inp[pt_seg]      >> pt_b) & 1);
}

//----------------------------------------------------
byte io_get_change_on(word num)
{
  byte pt_seg, pt_b;
  byte ret;

  pt_seg = num >> 3;   // byte pointer
  pt_b   = num & 0x07; // bit  pointer
  ret = 0;
  if ((inp_event_1[pt_seg]  >> pt_b) & 1) {
    inp_event_1[pt_seg] &= ~(1 << pt_b); // clear flag
    ret = 1;
  }
  return (ret);
}

//----------------------------------------------------
byte io_get_change_off(word num)
{
  byte pt_seg, pt_b;
  byte ret;

  pt_seg = num >> 3;   // byte pointer
  pt_b   = num & 0x07; // bit  pointer
  ret = 0;
  if ((inp_event_0[pt_seg]  >> pt_b) & 1) {
    inp_event_0[pt_seg] &= ~(1 << pt_b); // clear flag
    ret = 1;
  }
  return (ret);
}

//----------------------------------------------------
void io_set_state(byte num, byte val)
{
  outp[num] = val;
}

//----------------------------------------------------
void io_get_real_state(byte num)
{
  //read all inputs
  
//#define ifsetbit(cond, seg, bit) if (cond) inp_real[seg] |= (1 << bit); else inp_real[seg] &= ~(1 << bit)
#define ifsetbit(port, pin, seg, bit) if ((~PIN##port) & (1 << pin)) inp_real[seg] |= (1 << bit); else inp_real[seg] &= ~(1 << bit)

}

//----------------------------------------------------
void io_debounce_single(byte num, byte debounce_num)
{
  byte but_re, but; // temporary variables
  byte pt_seg, pt_b;

  pt_seg = num >> 3;   // byte pointer
  pt_b   = num & 0x07; // bit  pointer
  but_re = (inp_real[pt_seg] >> pt_b) & 1;
  but    = (inp[pt_seg]      >> pt_b) & 1;

  if (but != but_re) {
    // input is in different state - wait some time
    inp_cnt[num]++;
    if (but_re) {
      debounce_num = 9;
    }
    if (inp_cnt[num] >= debounce_num) {
      // reflect real state to shadow registers
      if (but_re) {
        inp[pt_seg] |=  (1 << pt_b);
       } else {
        inp[pt_seg] &= ~(1 << pt_b);
      }
    }
   } else {
    // input is in same state
    inp_cnt[num] = 0;
  }
}

//----------------------------------------------------
void io_calculate_output(byte num)
{
  byte val;
  byte pt_seg, pt_b;

  pt_seg = (num >> 3);     // byte pointer
  pt_b   = 7-(num & 0x07); // bit pointer
  
  val = outp[num] & 3;

  switch(val) {
    case 0: // off
	  io_out_unset(pt_seg, pt_b);
      break;
    case 1: // on
	  io_out_set(pt_seg, pt_b);
      break;

    case 2: // blink 2 Hz
      if (io_blink_2Hz) {
        io_out_set(pt_seg, pt_b);
       } else {
        io_out_unset(pt_seg, pt_b);
      }
      break;

    case 3: // blink 10 Hz
      if (io_blink_10Hz) {
        io_out_set(pt_seg, pt_b);
       } else {
        io_out_unset(pt_seg, pt_b);
      }
      break;

    default:
      break;
  }
}

//----------------------------------------------------
void io_loop(void)
{
  static byte io_loop_state = 0;
  byte num;
  byte seg;
  byte subseg;
  byte i;

  byte changes;
  // state machine state
  // 0 T T C  C C C C
  // 0 T T s  s i i i
  // C = counter in current task (0..31)
  // T = task
  // 0x00 - wait
  // 0x40 - get real state
  // 0x80 - debounce + calculate outputs
  // 0xC0 - detect changes in inputs
  
  if (io_flag_10Hz) {
    io_flag_10Hz = false;
    //dbg_show_byte(dbg); // show one byte on L and S
    // start io sequence
    if (io_loop_state == 0) io_loop_state = 1; // start if stopped

    // generate 2Hz signal
    if (++io_blink_2Hz_cnt > 5) {
      io_blink_2Hz_cnt = 0;
      if (io_blink_2Hz) io_blink_2Hz=0; else io_blink_2Hz=1;
    }
    
    // generate 10Hz signal
    if (io_blink_10Hz) io_blink_10Hz=0; else io_blink_10Hz=1;
  }

  num    = (io_loop_state & 0x3F); // 0 - 63
  seg    = (io_loop_state & 0xC0) >> 6; // 0 - 2
  subseg = (io_loop_state & 0x18) >> 3; // 0 - 2
  i      = (io_loop_state & 0x07); // 0 - 7

  // Task - real_state & prepare
  if (seg == 1) {
    if (num == 0) {
      // get real state
      //io_get_real_state(num);    // capture input state
      HCcomm();
      inp_real[0] = HCdatain[0];
      inp_real[1] = HCdatain[1];
    }
    //io_loop_state |= 0x1F;  // end of phase
  }

  // Task - debounce single + set outputs
  if (seg == 2) {
    switch (num) {
      case  0 ... 16:
        io_calculate_output(num);
        io_debounce_single(num, DEBOUNCE_NUM);
      case 17 ... 63:
        io_calculate_output(num);
        break;
      default:
        io_loop_state |= 0x3F;  // end of phase
        break;
    }
  }
  if ((seg == 3) && (subseg == 2)) {
    changes = (inp[i] ^ inp_last[i]); // detect changes
    inp_event_1[i] |= (( inp[i]) & changes); // catch transitions 0->1
    inp_event_0[i] |= ((~inp[i]) & changes); // catch transitions 1->0
    inp_last[i] = inp[i];
    
    if (i==2) io_loop_state = 0; // stop state machine - all is done
  }

  // if state machine is running move to next stage
  if (io_loop_state != 0) { io_loop_state++; }
}

//----------------------------------------------------
void io_timer_10hz(void)
{
  io_flag_10Hz = true;
}
