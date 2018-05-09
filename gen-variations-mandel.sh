#!/bin/bash

# ./fractastic M [width] [height]
#                [x_min] [x_max] [y_min] [y_max]
#                [max_iterations]
#                [color_multiplier]
#                [d]

WIDTH=500
HEIGHT=500

X_MIN=-2.0
X_MAX=2.0
Y_MIN=-2.0
Y_MAX=2.0
# function f(z) = zd + c
D=2   #  the real parameter d
C=10 # color_multiplier

#./run.sh examples/julia1 J $WIDTH $HEIGHT -2 2 -2 2 1000 20 -0.618 0 2

for d in 5 6 7 8 9 10; #2 3 4
do
  for shift in $(seq 0.0 0.1 2.6) # 0.0
  do
    for c in 20 # $(seq 10 5 40) # 20
    do
      min=$(echo "$X_MIN + ($shift*2)" | bc)
      max=$(echo $X_MAX - $shift | bc)
      echo "./run.sh out/mandel$d-$shift-c$c M $WIDTH $HEIGHT $min $max $min $max  1000 $c $d"
      ./run.sh out/mandel$d-$shift-c$c M $WIDTH $HEIGHT $min $max $min $max  1000 $c $d
    done
  done
done

