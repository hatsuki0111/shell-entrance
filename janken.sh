#!/bin/sh

<< COMMENTOUT
ひたすら、じゃんけんプログラムの作成
COMMENTOUT

jibun=-1
 aite=-1

random=$(od -A n -t u4 -N 4 /dev/urandom) #相手の手をランダムにする
aite=$(($random%3))

echo -n "あなたの手をいれてください[012]?"
read jibun

#入力判定if
if [ $jibun = "0" -o $jibun = "1" -o $jibun = "2" ];then
    echo input ok
else 
    exit 1
fi

#入力判定数字比較 ifの[]の空白に注意
if [ $jibun -eq 0 -o $jibun -eq 1 -o $jibun -eq 2 ];then
    echo input ok
else
   exit 1
fi

#入力判定swicth
case $jibun in
    0) echo input ok ;;
    1) echo input ok ;;
    2) echo input ok ;;
esac

#入力判定swicth
case $jibun in
    0 | 1 | 2 ) echo input ok;;
	     *) exit 1;;
esac


#コンピュータの手はランダムに決める
random=$(od -A n -t u4 -N 4 /dev/urandom)
  aite=$(($random%3))

#結果の出し方
kekka=$(((3+jibun-aite)%3)) 
echo "結果: $kekka"

#結果の条件文0が勝ち1が引き分け2が負け
if [ $kekka = 0 ];then
    echo 引き分け
elif [ $kekka = 1 ];then
    echo 負け
else
    echo 勝ち
fi
#結果の条件文switch
case $kekka in
    0) echo "あいこ";;
    1) echo "あなたの負け";;
    2) echo "あなたの勝ち";;
esac

#echo "結果: $kekka"
echo "注意: 判定は、0があいこ、1が負け、2が勝ちです"
