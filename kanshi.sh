#!/bin/sh

echo -n "監視IPアドレス="
read host

#pingコマンドの出力を捨てる/dev/nullリダイレクション
ping -c 1 -w 2 -n host >/dev/null
if [ $? -eq 0 ];then
	echo $host alive
        #ステータスを返す(成功)
	exit 0
else
	echo $host dead
	#ステータスを返す(失敗)
	exit 1
fi
