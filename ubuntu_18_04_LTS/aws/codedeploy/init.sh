#!/bin/bash

# This Script installs AWS code-deploy agent

cd /home/ubuntu
apt update -y
apt install -y ruby wget
wget https://aws-codedeploy-ap-northeast-2.s3.ap-northeast-2.amazonaws.com/latest/install
chmod +x ./install
./install auto
rm -rf ./install
service codedeploy-agent restart