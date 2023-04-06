(G-CODE GENERATED BY FLATCAM v8.994 - www.flatcam.org - Version Date: 2020/11/7)

(Name: outnc)
(Type: G-code from Geometry)
(Units: MM)

(Created on Friday, 20 January 2023 at 20:58)

(This preprocessor is the default preprocessor used by FlatCAM.)
(It is made to work with MACH3 compatible motion controllers.)

(TOOL DIAMETER: 2.0 mm)
(Feedrate_XY: 100.0 mm/min)
(Feedrate_Z: 60.0 mm/min)
(Feedrate rapids 1500.0 mm/min)

(Z_Cut: -2.6 mm)
(DepthPerCut: 0.7 mm <=>4 passes)
(Z_Move: 1.2 mm)
(Z Start: None mm)
(Z End: 10.0 mm)
(X,Y End: 0.0000, 0.0000 mm)
(Steps per circle: 64)
(Preprocessor Geometry: default)

(X range:    1.1540 ...   60.3539  mm)
(Y range:    1.1540 ...   87.3539  mm)

(Spindle Speed: 30000 RPM)
G21
G90
G94

; START
G01 F180.00
G00 Z1.2000

M03 S30000
G00 X1.1540 Y21.0040
G01 F60.00
G01 Z-0.7000
G01 F180.00
G01 X1.1540 Y1.1540
G01 X60.3539 Y1.1540
G01 X60.3539 Y21.0040
G00 X60.3539 Y21.0040
G01 F60.00
G01 Z-1.4000
G01 F180.00
G01 X60.3539 Y1.1540
G01 X1.1540 Y1.1540
G01 X1.1540 Y21.0040
G00 X1.1540 Y21.0040
G01 F60.00
G01 Z-2.1000
G01 F180.00
G01 X1.1540 Y1.1540
G01 X60.3539 Y1.1540
G01 X60.3539 Y21.0040
G00 X60.3539 Y21.0040
G01 F60.00
G01 Z-2.6000
G01 F180.00
G01 X60.3539 Y1.1540
G01 X1.1540 Y1.1540
G01 X1.1540 Y21.0040
G00 Z1.2000
G00 X1.1540 Y23.5040
G01 F60.00
G01 Z-0.7000
G01 F180.00
G01 X1.1540 Y43.3539
G01 X60.3539 Y43.3539
G01 X60.3539 Y23.5040
G00 X60.3539 Y23.5040
G01 F60.00
G01 Z-1.4000
G01 F180.00
G01 X60.3539 Y43.3539
G01 X1.1540 Y43.3539
G01 X1.1540 Y23.5040
G00 X1.1540 Y23.5040
G01 F60.00
G01 Z-2.1000
G01 F180.00
G01 X1.1540 Y43.3539
G01 X60.3539 Y43.3539
G01 X60.3539 Y23.5040
G00 X60.3539 Y23.5040
G01 F60.00
G01 Z-2.6000
G01 F180.00
G01 X60.3539 Y43.3539
G01 X1.1540 Y43.3539
G01 X1.1540 Y23.5040
G00 Z1.2000
G00 X1.1540 Y65.0040
G01 F60.00
G01 Z-0.7000
G01 F180.00
G01 X1.1540 Y45.1540
G01 X60.3539 Y45.1540
G01 X60.3539 Y65.0040
G00 X60.3539 Y65.0040
G01 F60.00
G01 Z-1.4000
G01 F180.00
G01 X60.3539 Y45.1540
G01 X1.1540 Y45.1540
G01 X1.1540 Y65.0040
G00 X1.1540 Y65.0040
G01 F60.00
G01 Z-2.1000
G01 F180.00
G01 X1.1540 Y45.1540
G01 X60.3539 Y45.1540
G01 X60.3539 Y65.0040
G00 X60.3539 Y65.0040
G01 F60.00
G01 Z-2.6000
G01 F180.00
G01 X60.3539 Y45.1540
G01 X1.1540 Y45.1540
G01 X1.1540 Y65.0040
G00 Z1.2000
G00 X1.1540 Y67.5040
G01 F60.00
G01 Z-0.7000
G01 F180.00
G01 X1.1540 Y87.3539
G01 X60.3539 Y87.3539
G01 X60.3539 Y67.5040
G00 X60.3539 Y67.5040
G01 F60.00
G01 Z-1.4000
G01 F180.00
G01 X60.3539 Y87.3539
G01 X1.1540 Y87.3539
G01 X1.1540 Y67.5040
G00 X1.1540 Y67.5040
G01 F60.00
G01 Z-2.1000
G01 F180.00
G01 X1.1540 Y87.3539
G01 X60.3539 Y87.3539
G01 X60.3539 Y67.5040
G00 X60.3539 Y67.5040
G01 F60.00
G01 Z-2.6000
G01 F180.00
G01 X60.3539 Y87.3539
G01 X1.1540 Y87.3539
G01 X1.1540 Y67.5040
G00 Z1.2000
M05
G00 Z1.2000
G00 Z10.00
G00 X0.0 Y0.0


; END
M5
