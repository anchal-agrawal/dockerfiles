#!/bin/bash

# Get a text file
mkdir text && cd text
wget http://www.gutenberg.org/cache/epub/1661/pg1661.txt
cd $HADOOP_HOME

# Run example Hadoop job
bin/hadoop fs -mkdir /input
bin/hadoop fs -copyFromLocal /text/pg1661.txt /input/pg1661.txt
bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.2.jar wordcount /input /output
