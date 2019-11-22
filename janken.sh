#!/bin/sh

<< COMMENTOUT
じゃんけんプログラムの作成
COMMENTOUT

jibun=-1
random=$(od -A n -t u4 -N 4 /dev/urandom) #相手の手をランダムにする
aite=$(($random%3))

echo -n "あなたの手をいれてください[012]?"
read jibun

kekka=$(((3+jibun-aite)%3)) #結果の出し方

echo "結果: $kekka"
echo "注意: 判定は、0があいこ、1が負け、2が勝ちです"
