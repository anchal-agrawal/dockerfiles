#!/bin/bash

# Replace the default IP with the container's IP in the Hadoop conf files
ip=$(ifconfig eth0 | grep "inet " | awk -F'[: ]+' '{ print $4 }')
sed -i -e "s/172.16.0.2/$ip/g" /hadoop-2.7.2/etc/hadoop/core-site.xml /hadoop-2.7.2/etc/hadoop/yarn-site.xml

# Hadoop breaks if the container name has an underscore and the /etc/hosts entry
# for 127.0.1.1 has the container name before the containerID like so:
# 127.0.1.1 foo_bar containerID
# Therefore, fix the /etc/hosts entry if needed.
entry=$(grep "127.0.1.1" /etc/hosts)
arr=($entry)
if echo ${arr[1]} | grep -q "_" ; then
        sed -i '/127.0.1.1/d' /etc/hosts
        fixedentry="${arr[0]} ${arr[2]} ${arr[1]}"
        echo $fixedentry >> /etc/hosts
fi

# Start Hadoop
$HADOOP_PREFIX/bin/hdfs namenode -format
$HADOOP_PREFIX/sbin/hadoop-daemon.sh start namenode
$HADOOP_PREFIX/sbin/hadoop-daemon.sh start datanode
$HADOOP_PREFIX/sbin/yarn-daemon.sh start resourcemanager
$HADOOP_PREFIX/sbin/yarn-daemon.sh start nodemanager

/bin/bash
