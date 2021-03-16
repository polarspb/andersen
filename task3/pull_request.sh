#!/bin/bash

#Global parametrs
MAN=$(echo ""application/vnd.github.v3+json" https://api.github.com")
LINE=--------------------------------------------

echo
echo -e "Select item: \n$LINE \n1 - Input URL (https://github.com/user/repo) \n2 - Manual input \n$LINE"
read INPUT

if [[ $INPUT -eq 1 ]]
 then
  echo -e "\nInput URL \n$LINE"
  read IN_URL
  echo -e "\n-------------------------------------------------------------------------------"
  API=$(sed 's!https://github.com!repos!g' <<< "$IN_URL") 
  curl -H $MAN/$API/issues | jq -r '.[] | .user .login' | sort | uniq -c  
elif [[ $INPUT -eq 2 ]]
 then 
  echo -n -e "\nInput user name: "
  read NAME
  echo $LINE
  echo -n "Input user repo: "
  read REPO
  echo "$LINE"
  echo -e "Select: \n1 - pull requests \n2 - contributors \n3 - followers  \n4 - all information \n$LINE"
  read MENU 
   if [[ -z $NAME || -z $REPO || -z $MENU ]]
    then
     echo -e "Error! No input Name, Repo or Menu item \n"
   elif [[ $MENU -eq 1 ]]
    then
     echo -e "\n-------------------------------------------------------------------------------"
     curl -H $MAN/repos/$NAME/$REPO/issues | jq -r '.[] | .user .login' | sort | uniq -c
   elif [[ $MENU -eq 2 ]]
    then
     curl -H $MAN/repos/$NAME/$REPO/contributors | jq -r '.[] | {"Login" : .login, "id" : .id, "url" : .url}'
   elif [[ $MENU -eq 3 ]]
    then
     curl -H $MAN/users/$NAME/followers | jq -r '.[] | {"Login" : .login, "id" : .id, "html_url" : .html_url}'
   elif [[ $MENU -eq 4 ]]
    then
     curl -H $MAN/repos/$NAME/$REPO/pulls
   else
     echo -e "\nWrong menu item\n"
 fi
 else
 echo -e "Wrong menu item \n"
fi
