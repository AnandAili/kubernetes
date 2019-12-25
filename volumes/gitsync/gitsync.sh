#!/bin/bash
mkdir /var/htdocs
cd /var/htdocs
#git clone https://github.com/AnandAili/kubia-website-example.git .
while :
do
  echo $(date)  Pulling files from GitHub to /var/htdocs
  #cd /var/htdocs
  git pull origin master
  sleep 10
done
