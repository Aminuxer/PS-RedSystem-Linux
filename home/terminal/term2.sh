#!/bin/sh

# RedSystem

dtm=`date "+%Y-%m-%d"`;
LOG="/home/terminal/boot_$dtm.log";

echo `date "+%Y-%m-%d %T"`'  Booting term2.sh' | tee -a $LOG

# script -q -c ''
/usr/bin/startx | tee -a $LOG

echo `date "+%Y-%m-%d %T"`"   ======= Terminal shutdown ======= " | tee -a $LOG
