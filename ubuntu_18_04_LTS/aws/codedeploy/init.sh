#!/bin/bash

# This Script installs AWS code-deploy agent

cd /home/ubuntu
sudo apt update -y
sudo apt install -y ruby

until service codedeploy-agent status >/dev/null 2>&1; do
   sleep 30
    sudo rm -rf install
    wget https://aws-codedeploy-ap-northeast-2.s3.ap-northeast-2.amazonaws.com/latest/install
    chmod +x ./install
    sudo ./install auto
    sudo service codedeploy-agent restart
done


# wget https://aws-codedeploy-ap-northeast-2.s3.ap-northeast-2.amazonaws.com/latest/install
# sudo chmod +x ./install
# sudo ./install auto
# if systemctl is-enabled --quiet codedeploy-agent; then
#   echo " --- CODEDEPLOY AGENT is ENABLED! --- "
#   if systemctl is-active --quiet codedeploy-agent; then
#     echo " --- CODEDEPLOY AGENT is ACTIVE! --- "
#   else
#     echo " --- CODEDEPLOY AGENT is NOT ACTIVE! --- "
#     sudo systemctl start codedeploy-agent
#     systemctl status codedeploy-agent
#   fi
# else
#   echo " --- CODEDEPLOY AGENT is NOT ENABLED! --- "
#   sudo systemctl enable codedeploy-agent
#   sudo systemctl start codedeploy-agent
#   sleep 5
#   if systemctl is-active --quiet codedeploy-agent; then
#     echo " --- CODEDEPLOY AGENT is ACTIVE! --- "
#   fi
# fi

# sudo service codedeploy-agent restart