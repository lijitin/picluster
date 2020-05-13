#!/bin/bash

# run log_pid_resource.sh in script

echo "Running Kmeans"
/Main/hadoop/bin/hadoop fs -mkdir /SparkExperiments
/Main/hadoop/bin/hadoop fs -mkdir /SparkExperiments/InputData
/Main/hadoop/bin/hadoop fs -mkdir /SparkExperiments/OutputData
/Main/hadoop/bin/hadoop fs -put /hdd/kmeans/kmeans3-50MB.txt /SparkExperiments/InputData/kmeans_data.txt
/Main/spark/bin/spark-submit --class "org.apache.spark.examples.mllib.JavaKMeansExample" --deploy-mode cluster /Main/example-java-build/JavaKMeansExample/target/JavaKMeansExample-1.0-SNAPSHOT.jar &
c_pid=$!
./log_sys_resource.sh

wait $c_pid # wait for the sorting program return

sleep 10 # << sleep for an extra 10s until we stop the logger
kill $(cat sar_pids)
rm sar_pids

echo "done."

