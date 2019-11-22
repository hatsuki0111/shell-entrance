#!/bin/sh

max=0

echo INPUTkey
read max
echo $max

#for kai in 1 2 3
#for kai in $(seq 1 3)

#キー入力した値の数だけ回す ハマった
for kai in $(seq $max)
do
    sh janken.sh
done
