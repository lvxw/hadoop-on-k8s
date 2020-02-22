#!/bin/bash

hive_dir=$(cd $(dirname $0)/../ && pwd )

echo ${hive_dir_dir}

rm -rf /media/mysql && mkdir -p /media/mysql

kubectl create -f ${hive_dir}/etc/
