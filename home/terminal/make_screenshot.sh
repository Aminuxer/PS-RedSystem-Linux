#!/bin/bash

# yum install ImageMagick

XAuth=`xauth list | grep MIT-MAGIC-COOKIE`;

if [ ! -n "$XAuth" ]
then
  echo "  No running X-Server under this user.
  Switch to user with running X-server:
     su terminal
  and try again." && exit 1;
else
  dtm=`date "+%Y-%m-%d__%T"`;
  env DISPLAY=":0" xwd -root > ./$dtm.xwd
  convert ./$dtm.xwd ./$dtm.png
  rm ./$dtm.xwd
fi
