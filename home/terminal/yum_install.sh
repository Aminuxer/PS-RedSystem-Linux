#!/bin/bash

yum remove ModemManager* NetworkManager* firewalld rpcstatd sendmail rpcbind nfs-lock

yum install google-chrome
yum install iptables-services iptables-utils links
yum install ntpdate pciutils usbutils htop minicom
yum install xterm xinput xinput_calibrator
yum install xorg-x11-server xorg-x11-server-Xorg xorg-x11-xinit xorg-x11-apps xorg-x11-utils
yum install xorg-x11-drv-intel xorg-x11-drv-keyboard xorg-x11-drv-mouse
yum install xorg-x11-drv-modesetting xorg-x11-drv-vesa xorg-x11-drv-fbdev
yum install xorg-x11-drv-wacom xorg-x11-drv-evdev xorg-x11-drv-dummy xorg-x11-drv-intel
