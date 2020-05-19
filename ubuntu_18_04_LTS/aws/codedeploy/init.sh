#!/bin/bash

# This Script installs AWS code-deploy agent

cd /home/ubuntu
sudo apt update -y
sudo apt install -y ruby wget
wget https://aws-codedeploy-ap-northeast-2.s3.ap-northeast-2.amazonaws.com/latest/install
chmod +x ./install
./install auto
sudo rm -rf ./install
sudo service codedeploy-agent restart
sudo service codedeploy-agent restart