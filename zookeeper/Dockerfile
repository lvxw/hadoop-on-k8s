FROM centos:7
WORKDIR /usr/local/src
RUN yum -y install vim wget dos2unix net-tools which java-1.8.0-openjdk-devel.x86_64 && \
    echo 'export JAVA_HOME=/usr/lib/jvm/java' >> /root/.bashrc && \
    echo 'export PATH=${PATH}:${JAVA_HOME}/bin' >> /root/.bashrc
RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/zookeeper/zookeeper-3.4.14/zookeeper-3.4.14.tar.gz
RUN tar -zxvf /usr/local/src/zookeeper-3.4.14.tar.gz -C /usr/local/ && \
    ln -s /usr/local/zookeeper-3.4.14 /usr/local/zookeeper && \
    rm -rf /usr/local/src/zookeeper-3.4.14.tar.gz && \
    mkdir -p /data/zookeeper/data /usr/local/zookeeper/logs && \
    echo 'export ZOOKEEPER_HOME=/usr/local/zookeeper' >> /root/.bashrc && \
    echo 'export PATH=${PATH}:${ZOOKEEPER_HOME}/bin' >> /root/.bashrc
COPY conf/* /usr/local/zookeeper/conf/
COPY bin/start-zookeeper-process.sh /usr/local/bin/
RUN dos2unix /usr/local/hive/conf/* /usr/local/bin/*
RUN chmod 755 /usr/local/bin/*
CMD /usr/local/bin/start-zookeeper-process.sh && tail -f /root/.bashrc
