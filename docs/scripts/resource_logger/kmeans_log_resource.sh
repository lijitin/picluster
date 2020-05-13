#!/bin/bash

# run log_resource.sh in script

echo "Running Kmeans"
/Main/hadoop/bin/hadoop fs -mkdir /SparkExperiments
/Main/hadoop/bin/hadoop fs -mkdir /SparkExperiments/InputData
/Main/hadoop/bin/hadoop fs -mkdir /SparkExperiments/OutputData
/Main/hadoop/bin/hadoop fs -put /hdd/kmeans/kmeans3-50MB.txt /SparkExperiments/InputData/kmeans_data.txt
/Main/spark/bin/spark-submit --class "org.apache.spark.examples.mllib.JavaKMeansExample" --deploy-mode cluster /Main/example-java-build/JavaKMeansExample/target/JavaKMeansExample-1.0-SNAPSHOT.jar &
c_pid=$!
./log_resource.sh $c_pid &
logger_pid=$!

wait $c_pid

sleep 1m # wait for disk io/ operations to complete
kill $logger_pid

/Main/hadoop/bin/hadoop fs -rm -r /SparkExperiments
echo "done."

