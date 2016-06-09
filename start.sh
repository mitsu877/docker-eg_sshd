#!/bin/sh

while getopts u:p: OPT
do
  case $OPT in
    "u" ) X_USER="$OPTARG" ;;
    "p" ) X_PASS="$OPTARG" ;;
  esac
done

if [ "$X_USER" != "" -a "$X_PASS" != "" ]; then
  adduser --disabled-password --gecos "" $X_USER
  gpasswd -a $X_USER sudo
  echo "$X_USER:$X_PASS" | chpasswd
fi

/usr/sbin/sshd -D
