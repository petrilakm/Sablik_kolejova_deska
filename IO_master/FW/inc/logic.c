// Logic of control panel

#include "common_defs.h"
#include "defines.h"
#include "inputs.h"
#include "xn_accessory.h"
#include "logic.h"

/*
 * usable functions:
 * 
 * byte io_get_state(byte num);  // get single value from inp variable
 * void io_set_state(byte num, byte val);  // set single value to outp variable
 * byte io_blink_2Hz
 * 
 * 
 */

void do_pult_logic_internal(void);
byte logic_event_flag;

byte logic_nocom_cnt = 0;
#define logic_nocom_cnt_max (6+1)

byte logic_flag_10Hz = 0; // private
byte logic_state = 0; // private
byte logic_inittimer = 80; // private

#define dbg_led_1 PORTB |=  BV(PB3) 
#define dbg_led_0 PORTB &= ~BV(PB3)
#define dbg_led_s PORTB ^=  BV(PB3)

//----------------------------------------------------
void logic_turnout_indicate(byte num, byte out)
{
  num--;
  byte indstate;
  if (xnacc_poweron) {
    indstate = 1; // power on -> steady LED
   } else {
    indstate = 2; // power off -> blink LED
  }
  if (xnacc_turnout_state[num] == 0) {
    io_set_state(out  ,0);
    io_set_state(out+1,0);
  }
  if (xnacc_turnout_state[num] == 1) {
    io_set_state(out  ,indstate);
    io_set_state(out+1,0);
  }
  if (xnacc_turnout_state[num] == 2) {
    io_set_state(out  ,0);
    io_set_state(out+1,indstate);
  }
  if (xnacc_turnout_state[num] == 3) {
    io_set_state(out  ,3);
    io_set_state(out+1,3);
  }
}

//----------------------------------------------------
void logic_nav_maketa_vjezd_indicate(word num, byte out) // výstup prvního io bloku (celkem 4), èíslo prvního výstupu (celkem 3)
{
  num--;
  byte indstate;
  if (xnacc_turnout_state[num+3] == 1) {
    indstate = 2; // blikací návìst -> blikání 0.5 Hz
   } else {
    indstate = 1; // normální návìst
  }  
  if (xnacc_turnout_state[num+0] == 1) {
    io_set_state(out  ,1);
   } else {
    io_set_state(out  ,0);  
  }
  if (xnacc_turnout_state[num+1] == 1) {
    io_set_state(out+1,indstate);
   } else {
    io_set_state(out+1,0);  
  }
  if (xnacc_turnout_state[num+2] == 1) {
    io_set_state(out+2,indstate);
   } else {
    io_set_state(out+2,0);  
  }
}

//----------------------------------------------------
void logic_nav_maketa_indicate(word num, byte out) // výstup prvního io bloku (celkem 3), èíslo prvního výstupu (celkem 2)
{
  num--;
  byte indstate;
  if (xnacc_turnout_state[num+2] == 1) {
    indstate = 2; // blikací návìst -> blikání 0.5 Hz
   } else {
    indstate = 1; // normální návìst
  }  
  if (xnacc_turnout_state[num+0] == 1) {
    io_set_state(out  ,indstate);
   } else {
    io_set_state(out  ,0);  
  }
  if (xnacc_turnout_state[num+1] == 1) {
    io_set_state(out+1,indstate);
   } else {
    io_set_state(out+1,0);  
  }
}

//----------------------------------------------------
void logic_indicate(word num, byte out) // výstup io bloku (xpressNET), èíslo výstupu (fyzický)
{
  num--;
  if (xnacc_turnout_state[num+0] == 1) {
    io_set_state(out  ,1);
   } else {
    io_set_state(out  ,0);  
  }
}

/*----------------------------------------------------
first boards is input board ->
00-15 only inputs
16-63 only outputs
---------------------------------------------------- */
//----------------------------------------------------
#define base (501)
void do_pult_logic_internal(void)
{
  switch(logic_state) {
  
    case 1:
      dbg_led_s;
      logic_nav_maketa_vjezd_indicate(base+0, 61); // L logic_nav_maketa_vjezd_indicate(first turnout address, first LED number)
      break;
    case 2:
      logic_nav_maketa_vjezd_indicate(base+4, 58);  // S
      break;
    case 3:
      logic_nav_maketa_indicate(base+8+3*0, 50);  // L1
      logic_nav_maketa_indicate(base+8+3*1, 40);  // L2
      logic_nav_maketa_indicate(base+8+3*2, 17);  // L3
      break;
    case 4:
      logic_nav_maketa_indicate(base+8+3*3,12);  // S1
      logic_nav_maketa_indicate(base+8+3*4,14);  // S2
      logic_nav_maketa_indicate(base+8+3*5,16);  // S3
      break;
    case 5:
      logic_indicate(base+26, 18); // IK 1
      logic_indicate(base+27, 19); // IK 2
      break;
    case 6:
      logic_indicate(base+28, 20); // IK 3 // nejede, nevim proc 2022-11-14 (Michal Petrilak)
      logic_indicate(base+29, 21); // IK 4
      break;
    case 7:
      logic_indicate(base+30, 22); // IK 5
      logic_indicate(base+31, 23); // IK 6
      break;
    case 8:
      logic_indicate(base+32, 24); // IK 7
      logic_indicate(base+33, 25); // IK 8
      // 26 - porucha izol stavù - není komunikace s centrálou
      break;
    case 9:
      logic_indicate(base+34, 27); // TS <- sk
      logic_indicate(base+35, 28); // TS VT
      logic_indicate(base+36, 29); // TS ->
      break;
    case 12:
      logic_indicate(base+37, 30); // TS <- ha
      logic_indicate(base+38, 31); // TS VT
      logic_indicate(base+39, 32); // TS ->
      break;
      
    case 13:
      if (io_get_change_on(0)) xnacc_turnout_action(base+48, 0); // button 0 operate turnout 549 to position - (RM 138)
	  if (io_get_change_on(1)) xnacc_turnout_action(base+49, 0); // button 1 operate turnout 550 to position - (RM 138)
	  if (io_get_change_on(2)) xnacc_turnout_action(base+50, 0); // button 2 operate turnout 551 to position - (RM 138)
	  if (io_get_change_on(3)) xnacc_turnout_action(base+51, 0); // button 3 operate turnout 552 to position - (RM 138)
	  if (io_get_change_on(4)) xnacc_turnout_action(base+52, 0); // button 4 operate turnout 553 to position - (RM 139)
      break;
    case 14:
	  if (io_get_change_off(0)) xnacc_turnout_action(base+48, 1); // button 0 operate turnout 549 to position +
	  if (io_get_change_off(1)) xnacc_turnout_action(base+49, 1); // button 1 operate turnout 550 to position +
	  if (io_get_change_off(2)) xnacc_turnout_action(base+50, 1); // button 2 operate turnout 551 to position +
	  if (io_get_change_off(3)) xnacc_turnout_action(base+51, 1); // button 3 operate turnout 552 to position +
	  if (io_get_change_off(4)) xnacc_turnout_action(base+52, 1); // button 4 operate turnout 553 to position +
      //if (xnacc_turnout_state[500]) dbg_led_1; else dbg_led_0;
      break;
    case 15:
      if (io_get_change_on(5)) xnacc_turnout_action(base+53, 0); // button 0 operate turnout 554 to position - (RM 139)
	  if (io_get_change_on(6)) xnacc_turnout_action(base+54, 0); // button 1 operate turnout 555 to position - (RM 139)
	  if (io_get_change_on(7)) xnacc_turnout_action(base+55, 0); // button 2 operate turnout 556 to position - (RM 139)
	  if (io_get_change_on(8)) xnacc_turnout_action(base+56, 0); // button 3 operate turnout 557 to position - (RM 140)
	  if (io_get_change_on(9)) xnacc_turnout_action(base+57, 0); // button 4 operate turnout 558 to position - (RM 140)
      break;
	case 16:
      if (io_get_change_off(5)) xnacc_turnout_action(base+53, 1); // button 0 operate turnout 554 to position +
	  if (io_get_change_off(6)) xnacc_turnout_action(base+54, 1); // button 1 operate turnout 555 to position +
	  if (io_get_change_off(7)) xnacc_turnout_action(base+55, 1); // button 2 operate turnout 556 to position +
	  if (io_get_change_off(8)) xnacc_turnout_action(base+56, 1); // button 3 operate turnout 557 to position + (RM 140)
	  if (io_get_change_off(9)) xnacc_turnout_action(base+57, 1); // button 4 operate turnout 558 to position + (RM 140)
      break;
    default:
      asm("nop");
      break;
  }

  if (logic_state > 0) logic_state++;
  if (logic_state > 35) logic_state = 0;
}

//----------------------------------------------------
void do_pult_logic(void)
{
  if (logic_flag_10Hz) {
    logic_flag_10Hz = false;
    // start logic state machine
    if (logic_state == 0) {
      logic_state = 1;
    } 

    // count inittimer
    if (logic_inittimer > 0) logic_inittimer--;

    //timer po zapnutí  // 78
    //if (logic_inittimer == 70) xnacc_trackpower_request(); // dotaz sa stav DCC
    //if (logic_inittimer == 24) xnacc_feedback_request(4);  // dotaz na pøestávník s adresou 4
    //if (logic_inittimer == 20) xnacc_feedback_request(5);
    //if (logic_inittimer == 16) xnacc_feedback_request(7);
    //if (logic_inittimer == 12) xnacc_feedback_request(9);  
    //if (logic_inittimer == 18) xnacc_feedback_request(11);
//     if (logic_inittimer == 40) {                           // pokud máme stavy, tak neprovádìj sekvenci dále 
//       byte sum = 0;
//       byte i;
//       for(i = 0; i < 20; i++) {
//         sum += xnacc_turnout_state[i];
//       }
//       if (sum > 4) logic_inittimer = 0; // pokud máme nìjaký stav, tak pøestaneme s inicializací (centrála není po restartu)
//     }
//     if (logic_inittimer == 35) xnacc_turnout_action(4, 1); // nastavit pøestavník s adresou 4 do +
//     if (logic_inittimer == 30) xnacc_turnout_action(5, 1);
//     if (logic_inittimer == 25) xnacc_turnout_action(7, 1);
//     if (logic_inittimer == 20) xnacc_turnout_action(9, 1);
//     if (logic_inittimer == 15) xnacc_turnout_action(11, 1);
//     
  }
  
  if (xnacc_ccavail) {
    do_pult_logic_internal();
  }
    
  if (!xnacc_ccavail) {
    logic_inittimer = 80;
    // command center is not available (no communication)
    io_set_state(26,3);    
  } else {
    io_set_state(26,0);
  }
}

//----------------------------------------------------
void logic_timer_10hz(void)
{
  logic_flag_10Hz = true;
}
