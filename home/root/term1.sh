#!/bin/sh

# RedSystem

dtm=`date "+%Y-%m-%d"`;
LOG="/root/boot_$dtm.log";


echo `date "+%Y-%m-%d %T"`"   ======= Terminal start, running term1.sh ======= " | tee -a $LOG
pkill redtshell
cd /home/terminal/RedSystem/redtshell
./redtshell &

for i in {0..9};
do
    echo `date "+%Y-%m-%d %T"`"  Apply setterm to [tty$i]" | tee -a $LOG
#    setterm -powersave off >> /dev/tty$i;
    setterm -blink off >> /dev/tty$i;
    setterm -blank 0  >> /dev/tty$i;
    setterm -powerdown 0 >> /dev/tty$i;
done;
unset i;

echo `date "+%Y-%m-%d %T"`"   ======= Terminal start, running term2 ======= " | tee -a $LOG
su - terminal -c "/home/terminal/term2.sh"
# /home/terminal/term2.sh
