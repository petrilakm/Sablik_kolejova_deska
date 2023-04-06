/*
 *
 * timer initialization and operation
 *
 */

#include <avr/io.h>
#include "common_defs.h"

//----------------------------------------------------
void timer_init(void)
{
  // Xtal = 14 745 600 Hz
  // Xtal =  1 000 000 Hz

  // * Timer 0 - fast system timer
  // 14745600 /    8   / 256 = 7200 Hz (0.1388888 ms)
  // 1000000 /    8   / 256 = 492.1259842.. Hz (0.1388888 ms)
  //   Xtal   / presca / TOP
  TCCR0B = 2; // ÷ 8
  TIMSK0 |= BV(TOIE0);


  // * Timer 1 - system timer and 2× PWM
  // 14745600 / 256 / 576 = 100 Hz
  // 1 000 000  / 256 / 39 = 100.160256.. Hz
  //   Xtal  /presca/ TOP
  
  OCR1A = 0;
  OCR1B = 0;
  ICR1 = 1562; //575; 
  TCCR1A = 0; // CTC (ICR1)
  //TCCR1B = BV(WGM12) | BV(WGM13) | 4; // CTC (ICR1) + presca = 256
  TCCR1B = BV(WGM12) | BV(WGM13) | (1 << CS12) | (1 << CS10); // CTC (ICR1) + presca = 256
  TIMSK1 |= BV(ICIE1); // capt int enabled

  // * Timer 2 - unused
  //TCCR2 = 0; // stopped
}

//----------------------------------------------------

//----------------------------------------------------
