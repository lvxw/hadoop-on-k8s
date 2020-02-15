FROM centos:7
WORKDIR /usr/local/src
RUN yum -y install vim wget dos2unix net-tools which java-1.8.0-openjdk-devel.x86_64 && \
    echo 'export JAVA_HOME=/usr/lib/jvm/java' >> /root/.bashrc && \
    echo 'export PATH=${PATH}:${JAVA_HOME}/bin' >> /root/.bashrc
RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-2.7.7/hadoop-2.7.7.tar.gz
RUN tar -zxvf /usr/local/src/hadoop-2.7.7.tar.gz -C /usr/local/ && \
    ln -s /usr/local/hadoop-2.7.7 /usr/local/hadoop && \
    rm -rf /usr/local/src/hadoop-2.7.7.tar.gz && \
    rm -rf /usr/local/hadoop/etc/hadoop/core-site.xml /usr/local/hadoop/etc/hadoop/hdfs-site.xml /usr/local/hadoop/etc/hadoop/mapred-site.xml /usr/local/hadoop/etc/hadoop/yarn-site.xml && \
    rm -rf /usr/local/hadoop/etc/hadoop/hadoop-env.sh /usr/local/hadoop/etc/hadoop/yarn-env.sh && \
    echo 'export HADOOP_HOME=/usr/local/hadoop' >> /root/.bashrc && \
    echo 'export PATH=${PATH}:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin' >> /root/.bashrc && \
    echo 'export HADOOP_CONF_DIR=${HADOOP_HOME}/etc/hadoop' >> /root/.bashrc && \
    echo 'export YARN_CONF_DIR=${HADOOP_HOME}/etc/hadoop' >> /root/.bashrc
COPY conf/hadoop/* /usr/local/hadoop/etc/hadoop/
RUN dos2unix /usr/local/hadoop/etc/hadoop/*
RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/spark/spark-2.3.4/spark-2.3.4-bin-hadoop2.7.tgz
RUN tar -zxvf /usr/local/src/spark-2.3.4-bin-hadoop2.7.tgz -C /usr/local/ && \
    ln -s /usr/local/spark-2.3.4-bin-hadoop2.7 /usr/local/spark && \
    rm -rf /usr/local/src/spark-2.3.4-bin-hadoop2.7.tgz && \
    echo 'export SPARK_HOME=/usr/local/spark' >> /root/.bashrc && \
    echo 'export PATH=${PATH}:${SPARK_HOME}/bin' >> /root/.bashrc
RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/flink/flink-1.9.2/flink-1.9.2-bin-scala_2.12.tgz
RUN tar -zxvf /usr/local/src/flink-1.9.2-bin-scala_2.12.tgz -C /usr/local/ && \
    ln -s /usr/local/flink-1.9.2 /usr/local/flink && \
    rm -rf /usr/local/src/flink-1.9.2-bin-scala_2.12.tgz && \
    echo 'export FLINK_HOME=/usr/local/flink' >> /root/.bashrc && \
    echo 'export PATH=${PATH}:${FLINK_HOME}/bin' >> /root/.bashrc
CMD tail -f /root/.bashrc
