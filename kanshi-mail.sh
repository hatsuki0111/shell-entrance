#!/bin/sh

echo -n "監視IPアドレス="
read host

ping -c 1 -w 2 -n $host >/dev/null
if [ $? -eq 0 ];then
  #ステータスを返す成功
  echo $host alive  >>log.ping
  exit 0
else 
  #ステータスを返す失敗
  echo $host dead  >>log.ping
  exit 1
fi 

#grepで検索し、tailで最終行の数行を表示、オプションの-3で最後の3行
#grepでdeadがあれば表示　wcでデータを数える　-lで行数だけ
lost=$(grep $host log.ping | tail -3 | grep dead | wc -l)

#$lost > 3
if [ $lost -ge 3 ];then
	#3回連続でdeadが帰ってきたときにメールの送信をする
	#mailはてきとー
	echo $host is dead | Mail -s kanshi hatsu@example.com
fi

exit 0
