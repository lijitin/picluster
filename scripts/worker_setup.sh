#!/bin/bash

WORKERS_PATH=$HADOOP_HOME/etc/hadoop/workers
rm $WORKERS_PATH
touch $WORKERS_PATH
for (( i=2; i<=$1; i++))
do
	echo pi$i >> $WORKERS_PATH 
done

chmod 777 $WORKERS_PATH

echo "$WORKERS_PATH file modified to $1 active node(s)."
echo "Done." 
