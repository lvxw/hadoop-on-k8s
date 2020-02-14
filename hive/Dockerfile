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
RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/hive/hive-1.2.2/apache-hive-1.2.2-bin.tar.gz
RUN tar -zxvf /usr/local/src/apache-hive-1.2.2-bin.tar.gz -C /usr/local/ && \
    ln -s /usr/local/apache-hive-1.2.2-bin /usr/local/hive && \
    rm -rf /usr/local/src/apache-hive-1.2.2-bin.tar.gz && \
    mkdir /usr/local/hive/logs && \
    echo 'export HIVE_HOME=/usr/local/hive' >> /root/.bashrc && \
    echo 'export PATH=${PATH}:${HIVE_HOME}/bin' >> /root/.bashrc
COPY conf/hive/* /usr/local/hive/conf/
COPY lib/mysql-connector-java-5.1.44.jar /usr/local/hive/lib/
COPY conf/hive/* /usr/local/hive/conf/
COPY bin/start-hive-process.sh /usr/local/bin/
RUN dos2unix /usr/local/hive/conf/* /usr/local/bin/*
RUN chmod 755 /usr/local/bin/*
CMD /usr/local/bin/start-hive-process.sh && tail -f /root/.bashrc
