#!/bin/bash
envsubst < /app/webadmin.ini.tpl > /app/cuberite/webadmin.ini


cd /app/cuberite
./Cuberite -s $PLAYERS -d

while true;
do 
date;
sleep 10;
done;
