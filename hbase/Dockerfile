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
    echo 'export PATH=${PATH}:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin' >> /root/.bashrc
COPY conf/hadoop/* /usr/local/hadoop/etc/hadoop/
RUN dos2unix /usr/local/hadoop/etc/hadoop/*
RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/hbase/hbase-1.4.12/hbase-1.4.12-bin.tar.gz
RUN tar -zxvf /usr/local/src/hbase-1.4.12-bin.tar.gz -C /usr/local/ && \
    ln -s /usr/local/hbase-1.4.12 /usr/local/hbase && \
    rm -rf /usr/local/src/hbase-1.4.12-bin.tar.gz && \
    echo 'export HBASE_HOME=/usr/local/hbase' >> /root/.bashrc && \
    echo 'export PATH=${PATH}:${HBASE_HOME}/bin' >> /root/.bashrc
COPY conf/hbase/* /usr/local/hbase/conf/
RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/phoenix/apache-phoenix-4.15.0-HBase-1.4/bin/apache-phoenix-4.15.0-HBase-1.4-bin.tar.gz
RUN tar -zxvf /usr/local/src/apache-phoenix-4.15.0-HBase-1.4-bin.tar.gz -C /usr/local/ && \
    ln -s /usr/local/apache-phoenix-4.15.0-HBase-1.4-bin /usr/local/phoenix && \
    rm -rf /usr/local/src/apache-phoenix-4.15.0-HBase-1.4-bin.tar.gz && \
    echo 'export PHOENIX_HOME=/usr/local/hbase' >> /root/.bashrc && \
    echo 'export PATH=${PATH}:${PHOENIX_HOME}/bin' >> /root/.bashrc && \
    cp /usr/local/phoenix/phoenix-core-4.15.0-HBase-1.4.jar /usr/local/hbase/lib
COPY bin/start-hbase-process.sh /usr/local/bin/
RUN dos2unix /usr/local/hbase/conf/* /usr/local/bin/*
RUN chmod 755 /usr/local/bin/*
CMD /usr/local/bin/start-hbase-process.sh && tail -f /root/.bashrc
