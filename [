#!/bin/sh

year=$(date +%Y)
date=$(date +%Y%m%d)
date_dir=/var/kanshi/data

if [ -s ./kanshi.conf ];then
  . ./kanshi.conf
fi

#ファイルから監視リストを読み込む
while read host
do
  _dir=$data_dir/$host/$year
  _log=$_dir/log.$date
  test -d $_dir || mkdir -p $_dir

  ping -c 1 -w 2 -n $host >/dev/null
  _unixtime=$(date +%s)
  if [ $? -eq 0 ];then
    #ステータスを返す成功
    echo $host alive  >>$_log
    exit 0
  else 
    #ステータスを返す失敗
    echo $host dead  >>$_log
    exit 1
  fi 

  #grepで検索し、tailで最終行の数行を表示、オプションの-3で最後の3行
  #grepでdeadがあれば表示　wcでデータを数える　-lで行数だけ
  lost=$(grep $host log.ping | tail -3 | grep dead | wc -l)

  #$lost > 3
  if [ $lost -ge 3 ];then
	echo $host is dead
  fi
done<list.ping

exit 0
