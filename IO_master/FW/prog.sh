#!/bin/bash
#avrdude -P /dev/ttyUSB0 -c STK500v2 -p m328p -U lfuse:w:0x62:m -U hfuse:w:0xda:m -U efuse:w:0xfd:m
avrdude -P /dev/ttyUSB0 -c STK500v2 -p m328p -U flash:w:kolejova_deska.hex:i -V

