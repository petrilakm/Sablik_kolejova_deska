            
#define _SFR_ASM_COMPAT 1
#define __SFR_OFFSET 0
#include <avr/io.h>
#include "sSPI.h"

.global HCcomm; The assembly function must be declared as global

; 0 ----- tmp
; 1 ----- 0
; 18-27 - volné registry
; 30-31 - volné registry

HCcomm:
            ;cli ; DEBUG 24_05_2016
            
            ; load pointer to HCdatain array (Z)
            ldi       r30, lo8(HCdatain)
            ldi       r31, hi8(HCdatain)
            ; point to HCdatain[6] (beyond array)
            adiw      r30, HC_NUM_REGISTERS
            
            ; load pointer to HCdataout array (Y)
            ldi       r28, lo8(HCdataout)
            ldi       r29, hi8(HCdataout)
            ; point to HCdataout[6] (beyond array)
            adiw      r28, HC_NUM_REGISTERS
            
            ; null tmp data register
            ;mov       dat, r1

            ; number of bytes
            ldi       counter, HC_NUM_REGISTERS
            
            ; sample inputs
            cbi       HCload
            nop
            sbi       HCload

; for bytes            
HCone:
            ; shift in one byte
            ldi       counter2, 8       ; number of bits
            
            ; load output byte
            ld        datout, -Y

; for 8 bits
bits:
            ; sample input pin
            clc
            sbic      HCinp
            sec
            rol       datin
            
            ; set output pin
            sbrs      datout,0
            cbi       HCout
            sbrc      datout,0
            sbi       HCout
            ror       datout

            nop
            nop
            nop
            

            ; pulse clock input
            sbi       HCclk
            nop
            nop
            cbi       HCclk

            ; count bits
            dec       counter2
            brne      bits
; end for 8 bits            
            ; store received byte to RAM
            com       datin
            st        -Z, datin
            
            ; count bytes
            dec       counter
            brne      HCone
; end for bytes
            
ahead:
            ; store outputs
            cbi       HCstore
            nop
            sbi       HCstore

            ;sei
            ret

; wait:       ldi       cnt_dbg, 230
; waitloop:   nop
;             nop
;             nop
;             nop
;             nop
;             nop
;             nop
;             nop
;             nop
;             nop
;             nop
;             nop
;             dec       cnt_dbg
;             brne      waitloop
;             ret

