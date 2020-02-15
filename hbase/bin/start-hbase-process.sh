#！/bin/bash

source /etc/profile
source /root/.bashrc

if [[ $PROC_TYPE == "master" ]]
then
	hbase-daemon.sh start master
elif [[ $PROC_TYPE == "regionserver" ]]
then
	hbase-daemon.sh start regionserver
fi