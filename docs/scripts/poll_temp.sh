#!/bin/bash

logpath=/exports/logs/
filename=pi_temps_$(date +"%m%d%Y-%H-%M")

for ((i=1;i<=16;i++));
do
    temp=$(ssh -i ~/pi/pi-key_id_rsa ubuntu@pi$i 'cat /sys/class/thermal/thermal_zone0/temp')
    echo pi$i $temp
done
