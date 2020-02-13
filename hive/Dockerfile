FROM centos:7
WORKDIR /usr/local/src
RUN yum -y install vim wget dos2unix net-tools which java-1.8.0-openjdk-devel.x86_64 && \
    echo 'export JAVA_HOME=/usr/lib/jvm/java' >> /etc/profile && \
    echo 'export PATH=${PATH}:${JAVA_HOME}/bin' >> /etc/profile
RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/hive/hive-1.2.2/apache-hive-1.2.2-bin.tar.gz
RUN tar -zxvf /usr/local/src/apache-hive-1.2.2-bin.tar.gz -C /usr/local/ && \
    ln -s /usr/local/apache-hive-1.2.2-bin /usr/local/hive && \
    rm -rf /usr/local/src/apache-hive-1.2.2-bin.tar.gz && \
    mkdir /usr/local/hive/logs && \
    echo 'export HiVE_HOME=/usr/local/hive' >> /etc/profile && \
    echo 'export PATH=${PATH}:${HIVE_HOME}/bin' >> /etc/profile
COPY conf/* /usr/local/hive/conf/
COPY lib/mysql-connector-java-5.1.44.jar /usr/local/hive/lib/
COPY ../hadoop/conf/* /usr/local/hive/conf/
COPY bin/start-hive-process.sh /usr/local/bin/
RUN dos2unix /usr/local/hive/conf/* /usr/local/bin/*
RUN chmod 755 /usr/local/bin/*
CMD /usr/local/bin/start-hive-process.sh && tail -f /etc/profile
