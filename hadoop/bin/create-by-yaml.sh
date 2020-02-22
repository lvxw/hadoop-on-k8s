#!/bin/bash

hadoop_dir=$(cd $(dirname $0)/../ && pwd )

echo ${hadoop_dir}

rm -rf /media/namenode && mkdir -p /media/namenode
ssh k8s-node01 rm -rf /media/datanode1
ssh k8s-node02 rm -rf /media/datanode2
ssh k8s-node03 rm -rf /media/datanode3
ssh k8s-node01 mkdir -p /media/datanode1
ssh k8s-node02 mkdir -p /media/datanode2
ssh k8s-node03 mkdir -p /media/datanode3

kubectl create -f ${hadoop_dir}/etc/
