#!/bin/bash

# This Script installs AWS code-deploy agent

cd /home/ubuntu
sudo apt update -y
sudo apt install -y ruby
sudo apt install -y build-essential

until service codedeploy-agent status >/dev/null 2>&1; do
   sleep 30
   sudo rm -rf install
   wget https://aws-codedeploy-ap-northeast-2.s3.ap-northeast-2.amazonaws.com/latest/install
   chmod +x ./install
   sudo ./install auto
   sudo service codedeploy-agent restart
   sudo rm -rf install
done
