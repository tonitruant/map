#!/bin/sh

export PATH=/usr/local/bin:$PATH

forever stop app.js

npm install
rm -r logs
mkdir logs

export OUTLOG=./logs/node-log.txt
export ERRLOG=./logs/node-log.txt
#export ERRLOG=./logs/node-error-log.txt
#export FOREVERLOG=./logs/forever-log.txt
#export HOSTNAME=map.amolina.ca
export HOSTNAME=map.verhoog.ca
export PORT=7003

forever --minUptime 5000 --spinSleepTime 2000 -a -o $OUTLOG -e $ERRLOG start app.js # >> $FOREVERLOG 2>&1
