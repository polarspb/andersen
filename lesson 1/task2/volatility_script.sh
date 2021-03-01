#!/bin/bash

jq -r '.prices[][]' quotes.json | cut -c 1-10 > out1

while read x
do
if [[ $x == 1* ]]
 then
   echo $(date -I -d @$x) 
 else
   echo $x
   echo 
fi
done < out1 > out2

for y in 2015 2016 2017 2018 2019 2020
 do
   k=$(cat out2 | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/ /g' -e 's/ 2/\n2/g' | grep -a "$y-03-" | awk 'BEGIN { coun=0; sum=0 } { coun++; sum+=$2 } END { print sum/coun }')
   echo "$k - $y"
 done > out3

cut -d" " -f1,2,3 out3 | sort -n | sed -n '1s/^/min=/p; $s/^/max=/p'

rm out1 out2 out3
