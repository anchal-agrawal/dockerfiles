#!/bin/bash

# Replace the default IP with the container's IP in the Hadoop conf files
ip=$(ifconfig eth0 | grep "inet " | awk -F'[: ]+' '{ print $4 }')
sed -i -e "s/172.16.0.2/$ip/g" /hadoop-2.7.2/etc/hadoop/core-site.xml /hadoop-2.7.2/etc/hadoop/yarn-site.xml

# Start Hadoop
$HADOOP_PREFIX/bin/hdfs namenode -format
$HADOOP_PREFIX/sbin/hadoop-daemon.sh start namenode
$HADOOP_PREFIX/sbin/hadoop-daemon.sh start datanode
$HADOOP_PREFIX/sbin/yarn-daemon.sh start resourcemanager
$HADOOP_PREFIX/sbin/yarn-daemon.sh start nodemanager

/bin/bash
