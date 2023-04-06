@echo off
echo.
del obj\kolejova_deska.elf
echo.
echo *** Linking ***
avr-gcc -mmcu=atmega328p obj\xn_stack.o obj\xn_accessory.o obj\logic.o obj\timer.o obj\xpressnet.o obj\inputs.o obj\sSPI.o obj\kolejova_deska.o -o obj\kolejova_deska.elf -Wl,--start-group -Wl,--end-group -Wl,--gc-sections -g -Wa,-adhlns=aa.lst -Wa,-L
echo Finish
echo.
"avr-objcopy" -O ihex -R .eeprom -R .fuse -R .lock -R .signature -R .user_signatures  "obj\kolejova_deska.elf" "kolejova_deska.hex"
"avr-objdump" -h -S -z "obj\kolejova_deska.elf" > "obj\kolejova_deska.lss"
"avr-objcopy" -j .eeprom  --set-section-flags=.eeprom=alloc,load --change-section-lma .eeprom=0  --no-change-warnings -O ihex "obj\kolejova_deska.elf" "obj\kolejova_deska.eep"
if exist obj\kolejova_deska.elf avr-size --format=berkeley obj\kolejova_deska.elf

echo on