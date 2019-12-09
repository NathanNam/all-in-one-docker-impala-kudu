#!/bin/bash

# /etc/init.d/hadoop-hdfs-namenode start
# /etc/init.d/hadoop-hdfs-datanode start
# /etc/init.d/hive-metastore start
# /etc/init.d/impala-server start
# /etc/init.d/impala-state-store start
# /etc/init.d/impala-catalog start
# /etc/init.d/kudu-master start
# /etc/init.d/kudu-tserver start

# tail -f /var/log/kudu/kudu-master.INFO -f /var/log/kudu/kudu-tserver.INFO -f /var/log/impala/impalad.INFO -f /var/log/impala/catalogd.INFO -f /var/log/impala/statestored.INFO



export JAVA_TOOL_OPTIONS="-Xss2m"

# Start hadoop-hdfs-namenode
/etc/init.d/hadoop-hdfs-namenode start -D
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start hadoop-hdfs-namenode: $status"
  exit $status
fi

# Start hadoop-hdfs-datanode
/etc/init.d/hadoop-hdfs-datanode start -D
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start hadoop-hdfs-datanode: $status"
  exit $status
fi

# Start hive-metastore
/etc/init.d/hive-metastore start -D
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start hive-metastore start: $status"
  exit $status
fi

# Start hive-server2
/etc/init.d/hive-server2 start -D
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start hive-server2 start: $status"
  exit $status
fi

# Start impala-server
/etc/init.d/impala-server start -D
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start impala-server start: $status"
  exit $status
fi

# Start impala-state-store
/etc/init.d/impala-state-store start -D
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start impala-state-store: $status"
  exit $status
fi

# Start impala-catalog start
/etc/init.d/impala-catalog start -D
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start impala-catalog start: $status"
  exit $status
fi

# Start kudu-master start
/etc/init.d/kudu-master start -D
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start kudu-master start: $status"
  exit $status
fi

# Start kudu-tserver
/etc/init.d/kudu-tserver start -D
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start kudu-tserver: $status"
  exit $status
fi

tail -f /var/log/kudu/kudu-master.INFO -f /var/log/kudu/kudu-tserver.INFO -f /var/log/impala/impalad.INFO -f /var/log/impala/catalogd.INFO -f /var/log/impala/statestored.INFO

