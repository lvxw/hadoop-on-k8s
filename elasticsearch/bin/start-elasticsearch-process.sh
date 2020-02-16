#！/bin/bash
su - es <<EOF
source /home/es/.bashrc
sed -i "s/NODE_NAME/${NODE_NAME}/g" /usr/local/elasticsearch/config/elasticsearch.yml
elasticsearch -d
EOF