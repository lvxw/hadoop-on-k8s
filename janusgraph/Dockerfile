FROM centos:7
WORKDIR /usr/local/src
RUN yum -y install unzip vim wget dos2unix net-tools which java-1.8.0-openjdk-devel.x86_64 && \
    echo 'export JAVA_HOME=/usr/lib/jvm/java' >> /root/.bashrc && \
    echo 'export PATH=${PATH}:${JAVA_HOME}/bin' >> /root/.bashrc
# RUN wget https://github-production-release-asset-2e65be.s3.amazonaws.com/77385607/673f0980-c683-11e8-8a8b-af7071a2cb61?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20200218%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20200218T134213Z&X-Amz-Expires=300&X-Amz-Signature=f5ff2ce3884b4be38dc6b2c5d6b77d41e3ce80153f8d7f6de658c584bc0775f4&X-Amz-SignedHeaders=host&actor_id=29973754&response-content-disposition=attachment%3B%20filename%3Djanusgraph-0.3.1-hadoop2.zip&response-content-type=application%2Foctet-stream
COPY data/janusgraph-0.3.1-hadoop2.zip /usr/local/src/
RUN unzip /usr/local/src/janusgraph-0.3.1-hadoop2.zip -d /usr/local/ && \
    ln -s /usr/local/janusgraph-0.3.1-hadoop2 /usr/local/janusgraph && \
    rm -rf /usr/local/src/janusgraph-0.3.1-hadoop2.zip && \
    rm -rf /usr/local/janusgraph/config/remote.yaml  && \
    echo 'export JANUSRAPH_HOME=/usr/local/janusgraph' >> /root/.bashrc && \
    echo 'export PATH=${PATH}:${JANUSRAPH_HOME}/bin' >> /root/.bashrc
COPY conf/janusgraph-hbase-es-server.properties /usr/local/janusgraph/conf/gremlin-server/
COPY conf/gremlin-hbase-es-server.yaml /usr/local/janusgraph/conf/gremlin-server/
COPY conf/remote.yaml /usr/local/janusgraph/conf/
COPY bin/start-janusgraph-process.sh /usr/local/bin/
RUN dos2unix /usr/local/janusgraph/conf/gremlin-server/* /usr/local/bin/* /usr/local/janusgraph/conf/*
RUN chmod 755 /usr/local/bin/*
CMD /usr/local/bin/start-janusgraph-process.sh && tail -f /root/.bashrc
