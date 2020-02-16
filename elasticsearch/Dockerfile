FROM centos:7
WORKDIR /usr/local/src
RUN yum -y install vim wget dos2unix net-tools which java-1.8.0-openjdk-devel.x86_64
#RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.1.0.tar.gz
COPY data/elasticsearch-6.1.0.tar.gz /usr/local/src/
RUN tar -zxvf /usr/local/src/elasticsearch-6.1.0.tar.gz -C /usr/local/ && \
    ln -s /usr/local/elasticsearch-6.1.0 /usr/local/elasticsearch && \
    rm -rf  /usr/local/src/elasticsearch-6.1.0.tar.gz && \
    rm -rf /usr/local/src/elasticsearch/config/elasticsearch.yml && \
    mkdir -p /data/elasticsearch/data &&  \
    groupadd es && \
    useradd es -g es && \
    echo 'export JAVA_HOME=/usr/lib/jvm/java' >> /home/es/.bashrc && \
    echo 'export PATH=${PATH}:${JAVA_HOME}/bin' >> /home/es/.bashrc && \
    echo 'export ELASTICSEARCH_HOME=/usr/local/elasticsearch' >> /home/es/.bashrc && \
    echo 'export PATH=${PATH}:${ELASTICSEARCH_HOME}/bin' >> /home/es/.bashrc
COPY conf/elasticsearch.yml /usr/local/elasticsearch/config/
COPY bin/start-elasticsearch-process.sh /usr/local/bin/
RUN dos2unix /usr/local/bin/* /usr/local/elasticsearch/config/*
RUN chmod 755 /usr/local/bin/*
RUN chown -R es:es  /usr/local/elasticsearch-6.1.0
RUN chown -R es:es  /data/elasticsearch
CMD /usr/local/bin/start-elasticsearch-process.sh && tail -f /root/.bashrc
