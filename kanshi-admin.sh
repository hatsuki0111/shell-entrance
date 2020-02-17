#!/bin/sh

#usageでhelpの表示
usage(){
	cat <<__HELP__
[Usage]

add IP   add IP address to monitor
del IP   delete IP under monitored
list     list up ...
__HELP__
}
#listでcat
#addで>>
#delでsedは^で先頭と$の最後で正規表現する
#helpでusage
case $1 in
	list) cat list.ping;;
	add ) echo $2>>list.ping;;
	del ) sed -i -e '/^'$2'$/d' list.ping;;
	help|* )usage;;
esac
