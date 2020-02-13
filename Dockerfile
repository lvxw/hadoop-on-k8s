FROM centos:7
WORKDIR /usr/local/src
RUN yum -y install vim wget dos2unix netstat which java-1.8.0-openjdk-devel.x86_64 && \
    echo 'export JAVA_HOME=/usr/lib/jvm/java' >> /etc/profile && \
    echo 'export PATH=${PATH}:${JAVA_HOME}/bin' >> /etc/profile
RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-2.7.7/hadoop-2.7.7.tar.gz
RUN tar -zxvf /usr/local/src/hadoop-2.7.7.tar.gz -C /usr/local/ && \
    ln -s /usr/local/hadoop-2.7.7 /usr/local/hadoop && \
    rm -rf /usr/local/src/hadoop-2.7.7.tar.gz && \
    rm -rf /usr/local/hadoop/etc/hadoop/core-site.xml /usr/local/hadoop/etc/hadoop/hdfs-site.xml /usr/local/hadoop/etc/hadoop/mapred-site.xml /usr/local/hadoop/etc/hadoop/yarn-site.xml && \
    rm -rf /usr/local/hadoop/etc/hadoop/hadoop-env.sh /usr/local/hadoop/etc/hadoop/yarn-env.sh && \
    echo 'export HADOOP_HOME=/usr/local/hadoop' >> /etc/profile && \
    echo 'export PATH=${PATH}:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin' >> /etc/profile && \
    mkdir -p /data/hadoop/dfs/name /data/hadoop/dfs/data
COPY conf/hadoop/* /usr/local/hadoop/etc/hadoop/
COPY bin/start-hadoop-process.sh /usr/local/bin/
RUN dos2unix /usr/local/hadoop/etc/hadoop/* /usr/local/bin/start-hadoop-process.sh
RUN  chmod 755 /usr/local/bin/*
CMD /usr/local/bin/start-hadoop-process.sh && tail -f /etc/profile
