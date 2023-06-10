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
void logic_nav_maketa_vjezd_indicate(word num, byte out) // v?stup prvn?o io bloku (celkem 4), ?slo prvn?o v?stupu (celkem 3)
{
  num--;
  byte indstate;
  if (xnacc_turnout_state[num+3] == 1) {
    indstate = 2; // blikac? n??t -> blik?? 0.5 Hz
   } else {
    indstate = 1; // norm?n? n??t
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
void logic_nav_maketa_indicate(word num, byte out) // v?stup prvn?o io bloku (celkem 3), ?slo prvn?o v?stupu (celkem 2)
{
  num--;
  byte indstate;
  if (xnacc_turnout_state[num+2] == 1) {
    indstate = 2; // blikac? n??t -> blik?? 0.5 Hz
   } else {
    indstate = 1; // norm?n? n??t
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
void logic_indicate(word num, byte out) // v?stup io bloku (xpressNET), ?slo v?stupu (fyzick?)
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
      logic_nav_maketa_vjezd_indicate(base+0, 17); // L (S) logic_nav_maketa_vjezd_indicate(first turnout address, first LED number)
      break;
    case 2:
      logic_nav_maketa_vjezd_indicate(base+4, 45);  // S (L)
      break;
    case 3:
      logic_nav_maketa_indicate(base+8 , 34);  // L1 (S1)
      logic_nav_maketa_indicate(base+11, 38);  // L2 (S3)
      logic_nav_maketa_indicate(base+14, 36);  // L3 (S2)
      break;
    case 4:
      logic_nav_maketa_indicate(base+17,27);  // S1 (L1)
      logic_nav_maketa_indicate(base+20,32);  // S2 (L3)
      logic_nav_maketa_indicate(base+23,29);  // S3 (L2)
      break;
    case 5:
      logic_indicate(base+40, 44); // Se 1
      logic_indicate(base+41, 16); // Pr.L (Pr.S)
      logic_indicate(base+42, 48); // Pr.S (Pr.L)
      logic_indicate(base+26, 43); // IK 1
      logic_indicate(base+27, 40); // IK 2
      break;
    case 6:
      logic_indicate(base+28, 41); // IK 3
      logic_indicate(base+29, 42); // IK 4
      break;
    case 7:
      logic_indicate(base+30, 23); // IK 5
      logic_indicate(base+31, 21); // IK 6
      break;
    case 8:
      logic_indicate(base+32, 22); // IK 7
      logic_indicate(base+33, 20); // IK 8
      // 26 - porucha izol stav? - nen? komunikace s centr?ou
      break;
    case 9:
      logic_indicate(base+34, 24); // TS skPS
      logic_indicate(base+35, 25); // TS skVT
      logic_indicate(base+36, 26); // TS skUS
      logic_indicate(base+37, 50); // TS <- ha
      logic_indicate(base+38, 51); // TS VT
      logic_indicate(base+39, 52); // TS ->
      break;
    case 12:
      logic_indicate(base+43, 53); // P?iv nav S1-S3 (L1-L3)
      logic_indicate(base+44, 54); // P?iv nav L1-L3 (S1-S3)
      logic_indicate(base+45, 55); // Dohliad izol. stavu
      break;
      
    case 13:
      if (io_get_change_on(0)) xnacc_turnout_action(201, 0); // button 0 operate turnout 549 to position - (RM 138)
  	  if (io_get_change_on(7)) xnacc_turnout_action(202, 0); // button 1 operate turnout 550 to position - (RM 138)
  	  if (io_get_change_on(1)) xnacc_turnout_action(203, 0); // button 2 operate turnout 551 to position - (RM 138)
  	  if (io_get_change_on(6)) xnacc_turnout_action(204, 0); // button 3 operate turnout 552 to position - (RM 138)
  	  if (io_get_change_on(2)) xnacc_turnout_action(205, 0); // button 4 operate turnout 553 to position - (RM 139)
      break;
    case 14:
  	  if (io_get_change_off(0)) xnacc_turnout_action(201, 1); // button 0 operate turnout 549 to position +
  	  if (io_get_change_off(7)) xnacc_turnout_action(202, 1); // button 1 operate turnout 550 to position +
  	  if (io_get_change_off(1)) xnacc_turnout_action(203, 1); // button 2 operate turnout 551 to position +
      if (io_get_change_off(6)) xnacc_turnout_action(204, 1); // button 3 operate turnout 552 to position +
  	  if (io_get_change_off(2)) xnacc_turnout_action(205, 1); // button 4 operate turnout 553 to position +
      //if (xnacc_turnout_state[500]) dbg_led_1; else dbg_led_0;
      break;
    case 15:
      if (io_get_change_on(5)) xnacc_turnout_action(206, 0); // button 0 operate turnout 554 to position - (RM 139)
	    if (io_get_change_on(3)) xnacc_turnout_action(207, 0); // button 1 operate turnout 555 to position - (RM 139)
	    if (io_get_change_on(4)) xnacc_turnout_action(208, 0); // button 2 operate turnout 556 to position - (RM 139)
	    if (io_get_change_on(8)) xnacc_turnout_action(209, 0); // button 3 operate turnout 557 to position - (RM 140)
	    if (io_get_change_on(15)) xnacc_turnout_action(210, 0); // button 4 operate turnout 558 to position - (RM 140)
      break;
	case 16:
      if (io_get_change_off(5)) xnacc_turnout_action(206, 1); // button 0 operate turnout 554 to position +
  	  if (io_get_change_off(3)) xnacc_turnout_action(207, 1); // button 1 operate turnout 555 to position +
  	  if (io_get_change_off(4)) xnacc_turnout_action(208, 1); // button 2 operate turnout 556 to position +
  	  if (io_get_change_off(8)) xnacc_turnout_action(209, 1); // button 3 operate turnout 557 to position + (RM 140)
  	  if (io_get_change_off(15)) xnacc_turnout_action(210, 1); // button 4 operate turnout 558 to position + (RM 140)
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
  int i;
  if (logic_flag_10Hz) {
    logic_flag_10Hz = false;
    // start logic state machine
    if (logic_state == 0) {
      logic_state = 1;
    } 

    // count inittimer
    if (logic_inittimer > 0) logic_inittimer--;
    if (logic_inittimer == 30) {
      for(i=0; i<20; i+=2) {
        xnacc_feedback_request(501+i);
      }
    }
    if (logic_inittimer == 28) {
      if (!xns_empty_queue()) {
        logic_inittimer++; // wait here
      }
    }
    if (logic_inittimer == 26) {
      for(i=0; i<20; i+=2) {
        xnacc_feedback_request(521+i);
      }
    }
    if (logic_inittimer == 14) {
      if (!xns_empty_queue()) {
        logic_inittimer++; // wait here
      }
    }
    if (logic_inittimer == 12) {
      for(i=0; i<8; i+=2) {
        xnacc_feedback_request(541+i);
      }
    }
    if (logic_inittimer == 10) {
      if (!xns_empty_queue()) {
        logic_inittimer++; // wait here
      }
    }
    if (logic_inittimer == 1) {
      for(i=0; i<11; i++) {
        xnacc_turnout_action(201+i, 1);
      }
    }
  }
  
  if (xnacc_ccavail) {
    do_pult_logic_internal();
  }
    
  if (!xnacc_ccavail) {
    logic_inittimer = 40;
    // command center is not available (no communication)
    io_set_state(49,3);    
  } else {
    io_set_state(49,0);
  }
}

//----------------------------------------------------
void logic_timer_10hz(void)
{
  logic_flag_10Hz = true;
}
