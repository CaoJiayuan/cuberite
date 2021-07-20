#!/bin/bash
envsubst < /app/webadmin.ini.tpl > /app/webadmin.ini
envsubst < /app/settings.ini.tpl > /app/settings.ini



cd /app
./Cuberite -s $PLAYERS -d

while true;
do 
date;
sleep 10;
done;
