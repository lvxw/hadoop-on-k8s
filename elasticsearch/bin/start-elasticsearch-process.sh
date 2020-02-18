#！/bin/bash
su - es <<EOF
source /home/es/.bashrc
elasticsearch -d
EOF