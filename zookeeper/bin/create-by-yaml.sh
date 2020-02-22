#!/bin/bash

zookeeper_dir=$(cd $(dirname $0)/../ && pwd )

echo ${zookeeper_dir}

rm -rf /media/zookeeper && mkdir -p /media/zookeeper
ssh k8s-node01 rm -rf /media/zookeeper1
ssh k8s-node02 rm -rf /media/zookeeper2
ssh k8s-node03 rm -rf /media/zookeeper3
ssh k8s-node01 mkdir -p /media/zookeeper1
ssh k8s-node02 mkdir -p /media/zookeeper2
ssh k8s-node03 mkdir -p /media/zookeeper3

kubectl create -f ${zookeeper_dir}/etc/
