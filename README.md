# sablik kolejova deska

připojení originální kolejové desky k hJOP pro indikace z modelového kolejiště.
Kolejová deska se chová jako virtuální vyhýbky na sběrnici XpressNET

pro komunikaci s XpressNETem je vytvořena knihovna, která komunikuje
s centrálou jako ovladač LH100.

Panel je jednoúčelový

Control panel for railway switch operation via XpressNET (NX)
tested on Lenz LZV100 and Paco's NanoX. Panel send messages same way as hand controller LH100.
Used microcontroller is ATmega328 (Arduino Nano) and SPI communication with 74HC595 and 74HC165 expanders,
but code can be easily deployed to other AVR family controllers.

On XpressNET there is many virtual switches, which are indicated on real outputs.
Control program (hJOP) sets this virtual switches via python API.

This control panel is only for one purpouse. All changes must be done in source code.