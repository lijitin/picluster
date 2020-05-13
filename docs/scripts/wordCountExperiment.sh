#!/bin/bash

#16 GB file for one worker
#32 GB file for two workers
#64 GB file for four worker
#128 GB file for eight workers
#256 GB file for sixteen workers
/exports/sbin/start-dfs.sh
/exports/sbin/start-yarn.sh
/exports/hadoop/bin/hadoop fs -mkdir /wordCount/
/exports/hadoop/bin/hadoop fs -mkdir /wordCount/Input
/exports/hadoop/bin/hadoop fs -mkdir /wordCount/Output
/exports/hadoop/bin/hadoop fs -put /exports/scripts/wc_data/file-32GB.txt /wordCount/Input/file-32GB.txt
#These jar file are located in the home of pi1! should be run on pi1
/exports/hadoop/bin/hadoop jar /home/ubuntu/input/WordCount.jar WordCount /hdd/data/file-32GB.txt /wordCount/Input/output32GB
#measure power here

#delete the workload from the hdfs
/exports/hadoop/bin/hadoop fs -rm -r /wordCount/


