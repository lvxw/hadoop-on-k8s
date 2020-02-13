#!/bin/bash

source /etc/profile

if [[ $PROC_TYPE == "namenode" ]]
then
        if [[ "`ls -A /data/hadoop/dfs/name`" = "" ]]
    then
        hdfs namenode -format
        fi
        hadoop-daemon.sh start namenode
elif [[ $PROC_TYPE == "datanode" ]]
then
        hadoop-daemon.sh start datanode
elif [[ $PROC_TYPE == "resourcemanager" ]]
then
        yarn-daemon.sh start resourcemanager
elif [[ $PROC_TYPE == "nodemanager" ]]
then
        yarn-daemon.sh start nodemanager
fi
