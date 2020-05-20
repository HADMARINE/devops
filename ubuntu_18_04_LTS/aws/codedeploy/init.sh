#!/bin/bash

# This Script installs AWS code-deploy agent

cd /home/ubuntu
sudo apt update -y
sudo apt install -y ruby wget

until service codedeploy-agent status >/dev/null 2>&1; do
   sleep 60
    rm -f install
    wget https://aws-codedeploy-ap-southeast 2.s3.amazonaws.com/latest/install
    chmod +x ./install
    sudo ./install auto
    service codedeploy-agent restart
done