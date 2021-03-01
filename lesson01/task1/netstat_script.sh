#!/bin/bash
echo
echo "Hello my friend!"
echo "If you want to see all info - input ALL" 
echo "If you want to see info about process, input name or state or number of PID of process:"
echo

read x

if [ -z "$x" ]
then
 echo "Error. Input text, please"
 echo
elif [ "$x" == "ALL" ]
then
 echo
  sudo netstat -tunapl
 echo
else 
 echo 
  sudo netstat -tunapl | grep $x
 echo
fi
