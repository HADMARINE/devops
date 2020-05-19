#!/bin/sh

# This Script installs AWS code-deploy agent

sudo apt update -y
sudo apt install -y ruby
wget https://aws-codedeploy-ap-northeast-2.s3.ap-northeast-2.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo rm -rf ./install
sudo service codedeploy-agent start