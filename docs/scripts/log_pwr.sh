#!/bin/bash

# restart the daemon
# systemctl restart pwrstatd

for i in {1..300}
do
	line='['$(date)'] '$(sudo pwrstat -status | grep "Load" | cut -d ' ' -f2)
	echo $line 
	sleep 1
done
	
