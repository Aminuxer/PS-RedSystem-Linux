#!/bin/sh

# RedSystem

echo `date "+%Y-%m-%d %T"`" ======= Running xinitrc ======="

echo "   ----- Clear chrome profile -----"
cd /home/terminal/RedSystem/chrome/
rm -r userdata
cp -r userdatabackup userdata

tch='MASTouch TouchSystems MASTouch USB Touchscreen';  # TouchScreen Name from xinput --list

echo `date "+%Y-%m-%d %T"`"   ----- xinput set-button-map -----"
# Disable double-clicks/right-buttons/other buttons
/usr/bin/xinput set-button-map "$tch" 1 0 0 0 0 0 0

echo `date "+%Y-%m-%d %T"`"   ----- xinput list diag -----"
/usr/bin/xinput list

echo `date "+%Y-%m-%d %T"`"   ----- xrandr tuning -----"
/usr/bin/xrandr
/usr/bin/xrandr --output VGA1 --mode "1024x768"

echo `date "+%Y-%m-%d %T"`"   ----- xset tuning -----"
/usr/bin/xset dpms force on
/usr/bin/xset -dpms
# /usr/bin/xset s noblank
/usr/bin/xset s off
/usr/bin/xset q

echo `date "+%Y-%m-%d %T"`"   ----- xinput list-props diag (1, before calibr) -----"
/usr/bin/xinput list-props "$tch"

echo `date "+%Y-%m-%d %T"`"   ----- Calibrate touch-screen , xinput set-int-prop -----"
# /usr/bin/xinput set-int-prop "$tch" "Evdev Axis Calibration" 32 20 1069 409 1244 # evdev
# /usr/bin/xinput map-to-output "$tch" VGA1 - If some screens present !
# In new versions of Fedora evdev deprecated, use libinput calibration
/usr/bin/xinput set-prop "$tch" "libinput Calibration Matrix" 30.2 0 .004032 0 37.25 -0.437500 0 0 1

echo `date "+%Y-%m-%d %T"`"   ----- xinput list-props diag (2, after calibr) -----"
/usr/bin/xinput list-props "$tch"

echo `date "+%Y-%m-%d %T"`"   ----- Start chromium as kiosk -----"
# Chrome is dead for x86_i386, use chromium
/usr/bin/chromium-browser --user-data-dir=userdata --app=http://127.0.0.1:88/redtshell --kiosk http://127.0.0.1:88/redtshell &
# Add XClock over in top-center of 1024*768
sleep 20 && /usr/bin/xclock -digital -strftime "%Y-%m-%d %T" -fg white -bg blue -update 1 -sharp -geometry +440+10

#/usr/bin/xinput_calibrator --device "$tch" -v > /var/tmp/xinput_calibr.txt
#xterm
