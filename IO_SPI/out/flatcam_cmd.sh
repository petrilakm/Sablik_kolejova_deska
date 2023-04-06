#!/bin/bash

if [[ "$#" != "2" ]]; then
  echo "required 2 arguments"
  exit 1
fi

basepath=$1
basename=$2

testfile() {
if [ ! -f $1 ]; then
  echo "file '$1' does't exist"
  exit 2
fi
}



if [ ! -d $basepath ]; then
  echo "basepath does'n exist (basepath=$basepath)"
  exit 2
fi
if [ ! -d $basepath/out ]; then
  echo "out dir does't exist (basepath=$basepath)"
  exit 2
fi
if [ ! -d $basepath/brd ]; then
  echo "brd dir does't exist (basepath=$basepath)"
  exit 2
fi
testfile ${basepath}/brd/${basename}.bot.grb
testfile ${basepath}/brd/${basename}.out.grb
testfile ${basepath}/brd/${basename}.exc

cat << EOF

# load
open_gerber ${basepath}/brd/${basename}.bot.grb -outname bot1
open_gerber ${basepath}/brd/${basename}.bot.grb -outname bot2
open_gerber ${basepath}/brd/${basename}.out.grb -outname outline1
open_gerber ${basepath}/brd/${basename}.out.grb -outname outline2

follow outline1 -outname outline_geo1
follow outline2 -outname outline_geo2
isolate bot1 -dia 0.22 -passes 4 -overlap 40 -combine 1 -outname iso1
isolate bot2 -dia 0.22 -passes 4 -overlap 40 -combine 1 -outname iso2
set_sys excellon_zeros T
open_excellon ${basepath}/brd/${basename}.exc -outname drl1
open_excellon ${basepath}/brd/${basename}.exc -outname drl2
offset iso2 0 44
offset outline_geo2 0 44
offset drl2 0 44
join_excellons drl drl1 drl2

join_geometry iso iso1 iso2
cutout outline_geo1 -dia 2.0 -margin 0.1 -gapsize 0.5 -gaps lr -outname out_cut1 
cutout outline_geo2 -dia 2.0 -margin 0.1 -gapsize 0.5 -gaps lr -outname out_cut2
join_geometry out_cut out_cut1 out_cut2
del iso1 -f
del iso2 -f
del outline1 -f
del outline2 -f
del bot1 -f
del bot2 -f
del drl1 -f
del drl2 -f
del outline_geo1 -f
del outline_geo2 -f
del out_cut1 -f
del out_cut2 -f
plot_all

# milld drl -milled_dias 3.2 -tooldia 2.0 -outname test -diatol 50 - nefunguje

# export etch
cncjob iso -z_cut -0.08 -z_move 1.2 -feedrate 240 -feedrate_z 120 -dia 0.2 -spindlespeed 30000 -outname etch
write_gcode etch  ${basepath}/out/${basename}_etch.nc
# export outlline
cncjob out_cut -z_cut -2.8 -dpp 0.7 -z_move 1.2 -feedrate 200 -feedrate_z 60 -dia 2 -spindlespeed 30000 -outname out
write_gcode out ${basepath}/out/${basename}_out.nc
#
# manually delect drill tool and export make drills
#
# export drills
write_gcode drl_cnc ${basepath}/out/${basename}_drill.nc
# end
EOF

echo "go"
