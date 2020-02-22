#!/bin/bash

elasticsearch_dir=$(cd $(dirname $0)/../ && pwd )

echo ${elasticsearch_dir}

ssh k8s-node01 rm -rf /media/elasticsearch1
ssh k8s-node02 rm -rf /media/elasticsearch2
ssh k8s-node03 rm -rf /media/elasticsearch3
ssh k8s-node01 mkdir -p /media/elasticsearch1
ssh k8s-node02 mkdir -p /media/elasticsearch2
ssh k8s-node03 mkdir -p /media/elasticsearch3

kubectl create -f ${elasticsearch_dir}/etc/
