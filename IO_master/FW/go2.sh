#!/bin/bash

echo
if [ -f  obj/kolejova_deska.elf ]; then
  rm -f obj/kolejova_deska.elf
fi
echo
echo --- Linking ---
avr-gcc -mmcu=atmega328p obj/xn_accessory.o obj/logic.o obj/timer.o obj/xpressnet.o obj/xn_stack.o obj/inputs.o obj/sSPI.o obj/kolejova_deska.o -o obj/kolejova_deska.elf -Wl,--start-group -Wl,--end-group -Wl,--gc-sections
echo Finish
echo
"avr-objcopy" -O ihex -R .eeprom -R .fuse -R .lock -R .signature -R .user_signatures  "obj/kolejova_deska.elf" "kolejova_deska.hex"
"avr-objcopy" -j .eeprom  --set-section-flags=.eeprom=alloc,load --change-section-lma .eeprom=0  --no-change-warnings -O ihex "obj/kolejova_deska.elf" "obj/kolejova_deska.eep"
if [ -f  obj/kolejova_deska.elf ]; then
  avr-size --format=avr obj/kolejova_deska.elf --mcu=atmega328p
fi

