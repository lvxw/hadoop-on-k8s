#！/bin/bash

source /etc/profile
source /root/.bashrc

nohup hive --service metastore > /usr/local/hive/logs/hivemetastore.log 2>&1 &
nohup hive --service hiveserver2 > /usr/local/hive/logs/hiveserver2.log 2>&1 & 