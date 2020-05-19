#!/bin/bash

mkdir scripts

echo curl -s https://raw.githubusercontent.com/HADMARINE/devops/master/ubuntu_18_04_LTS/node_backend/init.sh > ./scripts/initialize.sh
echo curl -s https://raw.githubusercontent.com/HADMARINE/devops/master/ubuntu_18_04_LTS/node_backend/test.sh  > ./scripts/test.sh
chmod -R +x scripts/

echo "Installed scripts successfully."
