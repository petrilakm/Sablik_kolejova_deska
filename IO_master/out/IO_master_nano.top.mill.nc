(.../Eagle_ulp/mill_new/pcb-gcode.ulp)
(Copyright 2005 - 2012 by John Johnson)
(See readme.txt for licensing terms.)
(This file generated from the board:)
(.../IO_master/DPS/IO_master_nano.brd)
(Current profile is .../Eagle_ulp/mill_new/profiles/GRBL.pp  )
(This file generated 29.10.2022 14:20:56)
(Settings from pcb-machine.h)
(  Tool Size)
(0.1900 )
(Z Axis Settings)
(  High     Up        Down     Drill)
(3.0000 	1.0000 	-0.0800 	-4.0000 )
(spindle on time = 2.0000)
(milling depth = -3.0000)
(text depth = -0.1000)
(tool change at 20.0000 20.0000 14.0000 )
(feed rate xy = F240.00 )
(feed rate z  = F100.00 )
G21
(Absolute Coordinates)
G90
G00 X0.0000 Y0.0000 
M03
G04 P2.00
G00 Z1.0000 
G00 X-1.0000 Y-1.0000 
G01 Z-3.0000 F100.00 
G01 X36.0000 Y-1.0000 F120.00 
G01 X36.0000 Y62.0000 
G01 X-1.0000 Y62.0000 
G01 X-1.0000 Y-1.0000 
G00 Z3.0000 
M05
M02
