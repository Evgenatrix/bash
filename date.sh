#! /bin/bash
# sudo date  MMDDhhmmYYss  # var.1
#  sudo date --set "2020-05-01 10:55:36"  # var.2
clear
echo " Set date and time"
echo " ================="
echo ""
echo " Local date and time: " 
date
echo ""
read -p " Set day, mon, year, hour, min and sec: " day mon year hour min sec
sudo date --set "$year-$mon-$day $hour:$min:$sec"
