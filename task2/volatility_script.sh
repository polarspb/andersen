#!/bin/bash

LINE=-------------------------------------------

{
sudo apt install curl -y
sudo apt install jq -y
} &> /dev/null

echo -e "\n$LINE \nCurl and jq installed \n$LINE"
echo -e -n "Please input month (format XX): "
read m
if [[ -z $m ]]
then
 echo -e "\nError! Month is empty\n"
 else
curl -s https://yandex.ru/news/quotes/graph_2000.json > ./quotes.json
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
   cat out2 | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/ /g' -e 's/ 2/\n2/g' | grep -a "$y-$m" | sort -n -k2 | awk '{ print $1 " " $2 }' > out3
   var_min=$(cut -d" " -f2 out3 | sed -n '1s/^//p')
   var_max=$(cut -d" " -f2 out3 | sed -n '$s/^//p')
   var_diff=$(awk "BEGIN { print $var_max - $var_min }")
   echo "$y-$m - $var_diff"
 done >> out4
echo "$LINE"
echo "Least volatile was" $(cut -d" " -f1,2,3 out4 | sort -n -k3 | sed -n '1s/^//p')
echo "$LINE"
echo
rm out1 out2 out3 out4 quotes.json
fi
