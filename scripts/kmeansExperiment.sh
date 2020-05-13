#!/bin/bash

#16 GB file for one worker
/Main/hadoop/sbin/start-dfs.sh
/Main/hadoop/sbin/start-yarn.sh
/Main/hadoop/bin/hadoop fs -mkdir /SparkExperiments
/Main/hadoop/bin/hadoop fs -mkdir /SparkExperiments/InputData
/Main/hadoop/bin/hadoop fs -mkdir /SparkExperiments/OutputData
/Main/hadoop/bin/hadoop fs -put /exports/scripts/kmeans/kmeans20MB.txt /SparkExperiments/InputData/kmeans_data.txt
/Main/spark/bin/spark-submit --class "org.apache.spark.examples.mllib.JavaKMeansExample" --deploy-mode cluster /exports/example-java-build/JavaKMeansExample/target/JavaKMeansExample-1.0-SNAPSHOT.jar



