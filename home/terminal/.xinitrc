#!/bin/sh

# RedSystem

echo `date "+%Y-%m-%d %T"`" ======= Running xinitrc ======="

echo "   ----- Clear chrome profile -----"
cd /home/terminal/RedSystem/chrome/
rm -r userdata
cp -r userdatabackup userdata

echo `date "+%Y-%m-%d %T"`"   ----- Calibrate touch-screen , xinput -----"
xinput set-int-prop "MASTouch TouchSystems MASTouch USB Touchscreen" "Evdev Axis Calibration" 32 20 1069 409 1244

echo `date "+%Y-%m-%d %T"`"   ----- xinput diag -----"
/usr/bin/xinput list
# /usr/bin/xinput list-props 9
# /usr/bin/xinput list-props 10

echo `date "+%Y-%m-%d %T"`"   ----- xinput set -----"
# /usr/bin/xinput set-button-map  9 1 0 0 0 0 0 0
# /usr/bin/xinput set-button-map 10 1 0 0 0 0

echo `date "+%Y-%m-%d %T"`"   ----- xrandr tuning -----"
/usr/bin/xrandr
/usr/bin/xrandr --output VGA1 --mode "1024x768"

echo `date "+%Y-%m-%d %T"`"   ----- xset tuning -----"
/usr/bin/xset dpms force on
/usr/bin/xset -dpms
# /usr/bin/xset s noblank
/usr/bin/xset s off
/usr/bin/xset q

echo `date "+%Y-%m-%d %T"`"   ----- Start chrome as kiosk -----"
/usr/bin/google-chrome --kiosk  http://127.0.0.1:88/redtshell --user-data-dir=userdata --app=http://127.0.0.1:88/redtshell

# xinput --list
# xinput_calibrator --device 10
# xterm

