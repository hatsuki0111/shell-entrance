#!/bin/sh

#max=0
max=3
  i=0
<<COMMENTOUT
echo INPUTkey
read max
echo $max
COMMENTOUT

<<COMMENTOUT
#for kai in 1 2 3
#for kai in $a(seq 1 3)


#キー入力した値の数だけ回す ハマった
for kai in $(seq $max)
do
    sh janken.sh
done
COMMENTOUT

<<COMMENTOUT
while [ $i -ne $max ]
do
    sh janken.sh
    #iの値を+1するには((算術演算))
    i=$(($i+1))
done
COMMENTOUT

#無限ループ
while true
do
    sh janken.sh

    #janken.shはqかQを入力された場合exit9でステータス9を返す
    if [ $? -eq 9 ];then
	break
    fi
done

exit 0
