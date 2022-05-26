TOKEN_BOT=""
CHAT_ID=""

for i in {1..254}
do
	       sleep 0 | timeout 1 telnet | egrep "(Connected*|Unable*)" >> /tmp/Report.txt

       done

       conn_dev=$(cat /tmp/Report.txt | grep Connected | wc -l)

MESSAGE="Laporan Jaringan:

       Hari/Tanggal:'$(date)'
       Laporan:
       '$(cat /tmp/Report.txt)'
       Total Connected Device : $conn_dev / 51
       "

sudo /usr/bin/curl -s -X POST "https://api.telegram.org/bot$TOKEN_BOT/sendMessage" -d chat_id="$CHAT_ID" -d text="$MESSAGE" > /dev/null 2 &>1
