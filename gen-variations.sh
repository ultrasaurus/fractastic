#!/bin/bash

# ./fractastic J [width] [height]
#                [x_min] [x_max] [y_min] [y_max]
#                [max_iterations]
#                [color_multiplier]
#                [c_re] [c_im]
#                [d]

WIDTH=500
HEIGHT=500

X_MIN=-2.0
X_MAX=2.0
Y_MIN=-2.0
Y_MAX=2.0
# function f(z) = zd + c
CRE=-0.4 # the real component of the complex parameter c
CIM=0.6 # the imaginary component of the complex parameter c
D=2   #  the real parameter d

C=10 # color_multiplier

#./run.sh examples/julia1 J $WIDTH $HEIGHT -2 2 -2 2 1000 20 -0.618 0 2

for d in 2 3 5 6;
do
  for cre in $(seq -0.4 0.1 1.1) # 0.4
  do
    for cim in $(seq -0.1 0.1 0.6) # 0.6
    do
        for shift in $(seq 0.0 0.1 2.6) # 0.0
        do
          for c in $(seq 10 5 40) # 20
          do
            min=$(echo "$X_MIN + ($shift*2)" | bc)
            max=$(echo $X_MAX - $shift | bc)
            echo "./run.sh out/julia$d-$cre J $WIDTH $HEIGHT $min $max $min $max   1000 $c $cre $cim $d"
            ./run.sh out/julia$d-$cre-$cim-$shift-c$c J $WIDTH $HEIGHT $min $max $min $max  1000 $c $cre $cim $d #0022FF
          done
        done
    done
  done
done

