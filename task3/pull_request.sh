#!/bin/bash
echo
echo -e "Select item: \n--------------------------- \n1 - Input URL (https://github.com/user/repo \n2 - Manual Imput \n---------------------------"
read INPUT
if [[ $INPUT -eq 1 ]]
then
 echo "Input URL"
 read IN_URL
 API=$(sed 's!github.com!api.github.com/repos!g' <<< "$IN_URL")
 echo $API
 echo -e "Select item: \n1 - all information \n2 - contributors \n3 - followers  \n4 - pull requests \n----------------------"
 read MENU 
 echo
  if [[ $MENU -eq 1 ]]
   then
   curl -H "Accept: application/vnd.github.v3+json" $API/contributors | jq -r '.[] | {"Login" : .login, "id" : .id, "url" : .url}'
  else
   echo "1"
  fi
elif [[ $INPUT -eq 2 ]]
then 
echo "2"
echo -n "Input user name: "
read NAME
echo "----------------------"
echo -n "Input user repo: "
read REPO
echo "----------------------"
echo -e "Select: \n1 - all information \n2 - contributors \n3 - followers  \n4 - pull requests \n----------------------"
read MENU 
echo
 if [[ -z $NAME || -z $REPO || -z $MENU ]]
 then
  echo "Error! No input Name or Repo or Punkt Menu"
 elif [[ $MENU -eq 1 ]]
 then
  curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/$NAME/$REPO/pulls
  echo "1"
 elif [[ $MENU -eq 2 ]]
 then
  echo "2"
  curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/$NAME/$REPO/contributors | jq -r '.[] | {"Login" : .login, "id" : .id, "url" : .url}'
 elif [[ $MENU -eq 3 ]]
 then
  echo "3"
  curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/users/$NAME/followers | jq -r '.[] | {"Login" : .login, "id" : .id, "html_url" : .html_url}'
 elif [[ $MENU -eq 4 ]]
 then
  echo "4"
  curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/$NAME/$REPO | jq -r '. | {"open pull request" : .open_issues}'
 else
  echo "Wrong menu item"
 fi
fi
