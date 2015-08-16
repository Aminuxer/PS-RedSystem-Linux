#!/bin/sh

# RedSystem

echo "   ======= Terminal clear and reload ======= "

pkill redtshell
sleep 15
pkill -9 redtshell
sleep 5

find /home/terminal -name "\!raudus-exception*.txt" -delete
find /home/terminal -name ".serverauth.*" -delete
find /home/terminal/RedSystem/redtshell -name "*.log" -delete

sync

sleep 5

/usr/sbin/reboot
