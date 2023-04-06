/* ========================================================================== */
/*                                                                            */
/*   (c) 2015 Michal Petrilak                                                 */
/*   (c) 2022 Michal Petrilak                                                 */
/*                                                                            */
/*   head file for sSPI.s                                                     */
/*                                                                            */
/*   libraly for reading inputs via 74HC165 & HC595 without SPI module        */
/*   using 3 pins on MCU                                                      */
/*                                                                            */
/* ========================================================================== */
#ifndef __HC165_H
#define __HC165_H


#define HC_NUM_REGISTERS  (8)



#ifdef __ASSEMBLER__

;#define clkR      r18   ; reset CLK
;#define clkS      r19   ; set CLK
   ; data received
#define datin     r20
   ; data to send
#define datout    r22
   ; byte counter
#define counter   r23
   ; bit counter
#define counter2  r21
#define cnt_dbg   r24

#define HCstore   PORTC, 3
#define HCout     PORTC, 1
#define HCload    PORTC, 4
#define HCclk     PORTC, 5
#define HCinp     PINC , 2

#else

byte HCdataout[HC_NUM_REGISTERS];
byte HCdatain[HC_NUM_REGISTERS];
void HCcomm(void);

#endif
#endif
