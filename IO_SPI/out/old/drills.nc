(G-CODE GENERATED BY FLATCAM v8.994 - www.flatcam.org - Version Date: 2020/11/7)

(Name: drl_cnc)
(Type: G-code from Geometry)
(Units: MM)

(Created on Friday, 20 January 2023 at 11:01)

(This preprocessor is the default preprocessor used by FlatCAM.)
(It is made to work with MACH3 compatible motion controllers.)


(TOOLS DIAMETER: )
(Tool: 1 -> Dia: 0.5994)
(Tool: 2 -> Dia: 0.8001)
(Tool: 3 -> Dia: 0.8992)
(Tool: 4 -> Dia: 3.2004)

(FEEDRATE Z: )
(Tool: 1 -> Feedrate: 300)
(Tool: 2 -> Feedrate: 300)
(Tool: 3 -> Feedrate: 300)
(Tool: 4 -> Feedrate: 300)

(FEEDRATE RAPIDS: )
(Tool: 1 -> Feedrate Rapids: 1500)
(Tool: 2 -> Feedrate Rapids: 1500)
(Tool: 3 -> Feedrate Rapids: 1500)
(Tool: 4 -> Feedrate Rapids: 1500)

(Z_CUT: )
(Tool: 1 -> Z_Cut: -1.7)
(Tool: 2 -> Z_Cut: -1.7)
(Tool: 3 -> Z_Cut: -1.7)
(Tool: 4 -> Z_Cut: -1.7)

(Tools Offset: )
(Tool: 1 -> Offset Z: 0.0)
(Tool: 2 -> Offset Z: 0.0)
(Tool: 3 -> Offset Z: 0.0)
(Tool: 4 -> Offset Z: 0.0)

(Z_MOVE: )
(Tool: 1 -> Z_Move: 2)
(Tool: 2 -> Z_Move: 2)
(Tool: 3 -> Z_Move: 2)
(Tool: 4 -> Z_Move: 2)

(Z Toolchange: 15 mm)
(X,Y Toolchange: 0.0000, 0.0000 mm)
(Z Start: None mm)
(Z End: 0.5 mm)
(X,Y End: None mm)
(Steps per circle: 64)
(Preprocessor Excellon: default)

(X range:    4.1529 ...   57.3532  mm)
(Y range:    4.1529 ...   84.3530  mm)

(Spindle Speed: 0 RPM)
G21
G90
G94

; START
G01 F300.00

M5
G00 Z15.0000
T1
G00 X-20.0000 Y20.0000
M6
(MSG, Change to Tool Dia = 0.5994 ||| Total drills for tool T1 = 12)
M0
G00 Z15.0000

G01 F300.00
M03
G4 P0.1
G00 X22.5730 Y14.0005
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X22.5730 Y19.3980
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X22.5730 Y58.0005
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X22.5730 Y63.3980
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X37.8130 Y63.0805
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X39.7180 Y64.3505
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X37.8130 Y58.0005
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X39.7180 Y56.7305
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X39.7180 Y20.3505
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X37.8130 Y19.0805
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X39.7180 Y12.7305
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X37.8130 Y14.0005
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G01 F300.00

M5
G00 Z15.0000
T2
G00 X-20.0000 Y20.0000
M6
(MSG, Change to Tool Dia = 0.8001 ||| Total drills for tool T2 = 64)
M0
G00 Z15.0000

G01 F300.00
M03
G4 P0.1
G00 X40.3530 Y25.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X42.8930 Y25.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X45.4330 Y25.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X47.9730 Y25.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X50.5130 Y25.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X50.5130 Y32.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X47.9730 Y32.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X45.4330 Y32.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X42.8930 Y32.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X40.3530 Y32.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X37.8130 Y32.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X35.2730 Y32.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X32.7330 Y32.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X32.7330 Y69.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X35.2730 Y69.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X37.8130 Y69.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X40.3530 Y69.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X42.8930 Y69.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X45.4330 Y69.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X47.9730 Y69.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X50.5130 Y69.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X50.5130 Y76.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X47.9730 Y76.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X45.4330 Y76.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X42.8930 Y76.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X40.3530 Y76.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X37.8130 Y76.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X35.2730 Y76.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X32.7330 Y76.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X28.9230 Y76.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X26.3830 Y76.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X23.8430 Y76.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X21.3030 Y76.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X18.7630 Y76.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X16.2230 Y76.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X13.6830 Y76.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X11.1430 Y76.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X11.1430 Y69.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X13.6830 Y69.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X16.2230 Y69.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X18.7630 Y69.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X21.3030 Y69.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X23.8430 Y69.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X26.3830 Y69.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X28.9230 Y69.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X28.9230 Y32.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X26.3830 Y32.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X23.8430 Y32.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X21.3030 Y32.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X18.7630 Y32.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X16.2230 Y32.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X13.6830 Y32.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X11.1430 Y32.7330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X11.1430 Y25.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X13.6830 Y25.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X16.2230 Y25.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X18.7630 Y25.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X21.3030 Y25.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X23.8430 Y25.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X26.3830 Y25.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X28.9230 Y25.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X32.7330 Y25.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X35.2730 Y25.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X37.8130 Y25.1130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G01 F300.00

M5
G00 Z15.0000
T3
G00 X-20.0000 Y20.0000
M6
(MSG, Change to Tool Dia = 0.8992 ||| Total drills for tool T3 = 78)
M0
G00 Z15.0000

G01 F300.00
M03
G4 P0.1
G00 X45.4330 Y17.4930
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X45.4330 Y14.9530
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X45.4330 Y12.4130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X45.4330 Y9.8730
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X45.4330 Y7.3330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X47.9730 Y7.3330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X47.9730 Y9.8730
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X47.9730 Y12.4130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X47.9730 Y14.9530
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X47.9730 Y17.4930
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X55.5930 Y23.8430
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X55.5930 Y26.3830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X55.5930 Y28.9230
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X50.5130 Y39.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X47.9730 Y39.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X45.4330 Y39.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X42.8930 Y39.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X40.3530 Y39.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X37.8130 Y39.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X45.4330 Y51.3330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X47.9730 Y51.3330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X47.9730 Y53.8730
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X45.4330 Y53.8730
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X45.4330 Y56.4130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X47.9730 Y56.4130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X47.9730 Y58.9530
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X45.4330 Y58.9530
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X45.4330 Y61.4930
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X47.9730 Y61.4930
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X55.5930 Y67.8430
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X55.5930 Y70.3830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X55.5930 Y72.9230
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X50.5130 Y83.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X47.9730 Y83.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X45.4330 Y83.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X42.8930 Y83.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X40.3530 Y83.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X37.8130 Y83.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X35.2730 Y83.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X32.7330 Y83.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X28.9230 Y83.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X26.3830 Y83.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X23.8430 Y83.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X21.3030 Y83.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X18.7630 Y83.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X16.2230 Y83.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X13.6830 Y83.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X11.1430 Y83.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X13.6830 Y61.4930
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X13.6830 Y58.9530
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X16.2230 Y61.4930
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X16.2230 Y58.9530
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X16.2230 Y56.4130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X13.6830 Y56.4130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X13.6830 Y53.8730
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X16.2230 Y53.8730
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X16.2230 Y51.3330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X13.6830 Y51.3330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X11.1430 Y39.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X13.6830 Y39.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X16.2230 Y39.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X18.7630 Y39.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X21.3030 Y39.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X23.8430 Y39.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X26.3830 Y39.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X28.9230 Y39.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X32.7330 Y39.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X35.2730 Y39.0830
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X16.2230 Y17.4930
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X13.6830 Y17.4930
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X13.6830 Y14.9530
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X13.6830 Y12.4130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X13.6830 Y9.8730
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X13.6830 Y7.3330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X16.2230 Y7.3330
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X16.2230 Y9.8730
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X16.2230 Y12.4130
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X16.2230 Y14.9530
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G01 F300.00

M5
G00 Z15.0000
T4
G00 X-20.0000 Y20.0000
M6
(MSG, Change to Tool Dia = 3.2004 ||| Total drills for tool T4 = 8)
M0
G00 Z15.0000

G01 F300.00
M03
G4 P0.1
G00 X5.7531 Y5.7531
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X5.7531 Y38.7528
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X5.7531 Y49.7531
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X5.7531 Y82.7528
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X55.7530 Y82.7528
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X55.7530 Y49.7531
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X55.7530 Y38.7528
G01 Z-2.4000
G01 Z0
G00 Z2.0000
G00 X55.7530 Y5.7531
G01 Z-2.4000
G01 Z0
G00 Z2.0000
M05
G00 Z0.50


; END
M5
