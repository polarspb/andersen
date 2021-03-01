#!/bin/bash

touch up-log.txt
chmod +x ./up-log.txt

function apt1 {
#apt-get -y update 
#apt-get -y upgrade
#apt-get -y dist-upgrade
apt-get -y update 
DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade -yq
DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade -yq
}

dest="/etc/apt/sources.list"

for i in jessie stretch buster

do

echo "deb http://ftp.debian.org/debian/ $i main" > $dest
echo "deb-src http://ftp.debian.org/debian/ $i main" >> $dest
echo "deb http://security.debian.org/debian-security $i/updates main" >> $dest
echo "deb http://security.debian.org/ $i/updates main" >> $dest
echo "deb-src http://security.debian.org/ $i/updates main" >> $dest
echo "deb http://ftp.debian.org/debian/ $i-updates main" >> $dest
echo "deb-src http://ftp.debian.org/debian/ $i-updates main" >> $dest

apt1

echo "$(date) - $i update successful" >> ./up-log.txt

done
