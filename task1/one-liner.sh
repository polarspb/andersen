#!/bin/bash

echo
echo "Input process name or PID:"

read STR

PINFO=$(netstat -tunapl | awk '{print "$STR" $5 $7}' | cut -d: -f1 | sort | uniq -c | sort | tail -n5 | grep -oP '(\d+\.){3}\d+')
PNAME=$(ss -tup | sed -n '/'\"$STR'/p')
PID=$(ss -tup | sed -n '/'=$STR'/p')

echo "-----------------------------------------"
echo
if [ -z "$STR" ]
then
 echo "Error. Please input process name/ID."
 echo
elif [[ -z "$PNAME" && -z "$PID" ]]
then
 echo "Error. Wrong process name/ID."
 echo
elif [ -n "$PINFO" ] 
then
 echo "$PINFO" | while read IP ; do whois $IP | awk -F':' '/^Organization/ || /^Address/ || /^City/ || /^Country/ {print $0}' ; done 
 echo
else 
 echo "Error. No connection!"
 echo
fi
echo "-----------------------------------------"
echo
