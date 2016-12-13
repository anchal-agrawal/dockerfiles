FROM anchal/vic-hadoop-base

MAINTAINER Anchal Agrawal <anchala@vmware.com>

RUN apt-get update

# Set Hadoop env
ENV HADOOP_PREFIX /hadoop-2.7.2
ENV HADOOP_HOME $HADOOP_PREFIX
ENV HADOOP_COMMON_HOME $HADOOP_PREFIX
ENV HADOOP_CONF_DIR $HADOOP_PREFIX/etc/hadoop
ENV HADOOP_HDFS_HOME $HADOOP_PREFIX
ENV HADOOP_MAPRED_HOME $HADOOP_PREFIX
ENV HADOOP_YARN_HOME $HADOOP_PREFIX

# Update Hadoop confs and launch processes
CMD ["./bootstrap.sh"]

