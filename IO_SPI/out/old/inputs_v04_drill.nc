(G-CODE GENERATED BY FLATCAM v8.994 - www.flatcam.org - Version Date: 2020/11/7)

(Name: drl_cnc)
(Type: G-code from Geometry)
(Units: MM)

(Created on Sunday, 05 February 2023 at 13:53)

(This preprocessor is the default preprocessor used by FlatCAM.)
(It is made to work with MACH3 compatible motion controllers.)


(TOOLS DIAMETER: )
(Tool: 1 -> Dia: 0.59944)
(Tool: 2 -> Dia: 0.8000999999999999)
(Tool: 3 -> Dia: 0.8128)
(Tool: 4 -> Dia: 0.89916)
(Tool: 5 -> Dia: 0.9143999999999999)
(Tool: 6 -> Dia: 3.2994599999999994)

(FEEDRATE Z: )
(Tool: 1 -> Feedrate: 120.0)
(Tool: 2 -> Feedrate: 120.0)
(Tool: 3 -> Feedrate: 120.0)
(Tool: 4 -> Feedrate: 120.0)
(Tool: 5 -> Feedrate: 120.0)
(Tool: 6 -> Feedrate: 200.0)

(FEEDRATE RAPIDS: )
(Tool: 1 -> Feedrate Rapids: 2000.0)
(Tool: 2 -> Feedrate Rapids: 2000.0)
(Tool: 3 -> Feedrate Rapids: 2000.0)
(Tool: 4 -> Feedrate Rapids: 2000.0)
(Tool: 5 -> Feedrate Rapids: 2000.0)
(Tool: 6 -> Feedrate Rapids: 2000.0)

(Z_CUT: )
(Tool: 1 -> Z_Cut: -3.0)
(Tool: 2 -> Z_Cut: -3.0)
(Tool: 3 -> Z_Cut: -3.0)
(Tool: 4 -> Z_Cut: -3.0)
(Tool: 5 -> Z_Cut: -3.0)
(Tool: 6 -> Z_Cut: -3.0)

(Tools Offset: )
(Tool: 1 -> Offset Z: 0.0)
(Tool: 2 -> Offset Z: 0.0)
(Tool: 3 -> Offset Z: 0.0)
(Tool: 4 -> Offset Z: 0.0)
(Tool: 5 -> Offset Z: 0.0)

(Z_MOVE: )
(Tool: 1 -> Z_Move: 2)
(Tool: 2 -> Z_Move: 2)
(Tool: 3 -> Z_Move: 2)
(Tool: 4 -> Z_Move: 2)
(Tool: 5 -> Z_Move: 2)
(Tool: 6 -> Z_Move: 2)

(Z Toolchange: 15 mm)
(X,Y Toolchange: -40.0000, 20.0000 mm)
(Z Start: 15 mm)
(Z End: 15.0 mm)
(X,Y End: -40.0000, 20.0000 mm)
(Steps per circle: 64)
(Preprocessor Excellon: default)

(X range:    4.1034 ...   57.4027  mm)
(Y range:    4.1034 ...   50.4025  mm)

(Spindle Speed: 30000 RPM)
G21
G90
G94

; START
G01 F120.00

M5
G00 Z15.0000
T1
G00 X-40.0000 Y20.0000                
M6
(MSG, Change to Tool Dia = 0.5994 ||| Total drills for tool T1 = 8)
M0
G00 Z15.0000

G01 F120.00
M03 S30000
G4 P0.2
G00 X38.9331 Y11.4605
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X33.8531 Y8.9205
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X30.9956 Y14.0005
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X33.8531 Y20.3505
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X30.9956 Y20.3505
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X12.2631 Y37.1780
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X35.1231 Y37.1780
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X38.9331 Y20.3505
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G01 F120.00

M5
G00 Z15.0000
T2
G00 X-40.0000 Y20.0000                
M6
(MSG, Change to Tool Dia = 0.8001 ||| Total drills for tool T2 = 18)
M0
G00 Z15.0000

G01 F120.00
M03 S30000
G4 P0.2
G00 X55.4431 Y41.6230
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X52.9031 Y41.6230
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X50.3631 Y41.6230
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X47.8231 Y41.6230
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X45.2831 Y41.6230
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X42.7431 Y41.6230
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X40.2031 Y41.6230
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X37.6631 Y41.6230
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X35.1231 Y41.6230
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X31.3131 Y41.6230
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X28.7731 Y41.6230
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X26.2331 Y41.6230
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X23.6931 Y41.6230
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X21.1531 Y41.6230
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X18.6131 Y41.6230
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X16.0731 Y41.6230
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X13.5331 Y41.6230
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X10.9931 Y41.6230
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G01 F120.00

M5
G00 Z15.0000
T3
G00 X-40.0000 Y20.0000                
M6
(MSG, Change to Tool Dia = 0.8128 ||| Total drills for tool T3 = 32)
M0
G00 Z15.0000

G01 F120.00
M03 S30000
G4 P0.2
G00 X54.1731 Y26.3830
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X51.6331 Y26.3830
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X49.0931 Y26.3830
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X46.5531 Y26.3830
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X44.0131 Y26.3830
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X41.4731 Y26.3830
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X38.9331 Y26.3830
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X36.3931 Y26.3830
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X30.0431 Y26.3830
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X27.5031 Y26.3830
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X24.9631 Y26.3830
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X22.4231 Y26.3830
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X19.8831 Y26.3830
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X17.3431 Y26.3830
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X14.8031 Y26.3830
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X12.2631 Y26.3830
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X12.2631 Y34.0030
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X14.8031 Y34.0030
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X17.3431 Y34.0030
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X19.8831 Y34.0030
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X22.4231 Y34.0030
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X24.9631 Y34.0030
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X27.5031 Y34.0030
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X30.0431 Y34.0030
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X36.3931 Y34.0030
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X38.9331 Y34.0030
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X41.4731 Y34.0030
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X44.0131 Y34.0030
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X46.5531 Y34.0030
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X49.0931 Y34.0030
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X51.6331 Y34.0030
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X54.1731 Y34.0030
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G01 F120.00

M5
G00 Z15.0000
T4
G00 X-40.0000 Y20.0000                
M6
(MSG, Change to Tool Dia = 0.8992 ||| Total drills for tool T4 = 19)
M0
G00 Z15.0000

G01 F120.00
M03 S30000
G4 P0.2
G00 X5.9131 Y32.7330
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X5.9131 Y30.1930
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X5.9131 Y27.6530
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X50.3631 Y49.8780
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X47.8231 Y49.8780
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X45.2831 Y49.8780
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X42.7431 Y49.8780
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X40.2031 Y49.8780
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X37.6631 Y49.8780
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X35.1231 Y49.8780
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X32.5831 Y49.8780
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X28.7731 Y49.8780
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X26.2331 Y49.8780
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X23.6931 Y49.8780
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X21.1531 Y49.8780
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X18.6131 Y49.8780
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X16.0731 Y49.8780
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X13.5331 Y49.8780
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X10.9931 Y49.8780
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G01 F120.00

M5
G00 Z15.0000
T5
G00 X-40.0000 Y20.0000                
M6
(MSG, Change to Tool Dia = 0.9144 ||| Total drills for tool T5 = 20)
M0
G00 Z15.0000

G01 F120.00
M03 S30000
G4 P0.2
G00 X45.2831 Y7.3330
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X47.8231 Y7.3330
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X47.8231 Y9.8730
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X47.8231 Y12.4130
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X47.8231 Y14.9530
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X47.8231 Y17.4930
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X45.2831 Y17.4930
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X45.2831 Y14.9530
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X45.2831 Y12.4130
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X45.2831 Y9.8730
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X16.0731 Y9.8730
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X16.0731 Y12.4130
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X16.0731 Y14.9530
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X16.0731 Y17.4930
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X13.5331 Y17.4930
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X13.5331 Y14.9530
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X13.5331 Y12.4130
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X13.5331 Y9.8730
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X13.5331 Y7.3330
G01 Z-3.0000
G01 Z0
G00 Z2.0000
G00 X16.0731 Y7.3330
G01 Z-3.0000
G01 Z0
G00 Z2.0000
M05
G00 Z15.00
G00 X-40.0 Y20.0


; END
M5