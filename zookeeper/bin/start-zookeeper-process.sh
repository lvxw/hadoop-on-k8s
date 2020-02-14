#！/bin/bash

source /etc/profile
source /root/.bashrc
if [[ ! -e /data/zookeeper/myid ]]
then
   echo ${NODE_NUMBER} > /data/zookeeper/myid
fi
nohup zkServer.sh start > /usr/local/zookeeper/logs/zk-start.log 2>&1 &