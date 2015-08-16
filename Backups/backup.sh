#!/bin/bash

date=`date "+%Y_%m_%d"`;             # current date
days_store='12';                     # Number of backups (N last days)
dir_open=/Backups/Data               # directory for store backups
tgz_bin='tar --acls -p --xattrs --label="PayTerm1" --gzip -cf ';           # Tar/GZip binary + options

echo "=== BackUp script for PayTerm1 === [$date]  ";
mkdir $dir_open/$date
sync

echo 'Make open archives ...';
cd $dir_open/$date
$tgz_bin PT1_home.tgz /home/terminal /home/backuper /root
$tgz_bin PT1_etc.tgz /etc/sysconfig/iptables* /var/spool/cron /etc/ssh /etc/rc.d/rc.local /etc/passwd /etc/group /etc/X11
cd $dir_open/$date && sha256sum * > _WPT1.sha256

sync

cd /

echo 'Delete old backups ...';
find $dir_open/ -mtime +$days_store -delete     # store backups for N last days

echo "=== BackUp script complete ===== [$date]";
sync;

sleep 5;
cp /Backups/backup.log $dir_open/$date
