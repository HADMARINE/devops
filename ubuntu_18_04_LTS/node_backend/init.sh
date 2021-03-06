#!/bin/bash

function execute() {
  sudo apt update -y
  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt update
  sudo apt install -y nodejs yarn nginx
  sudo npm install -g pm2
  sudo chmod -R 777 /home/ubuntu/.config
  sudo rm -rf /etc/nginx/sites-available/default
  sudo echo "
  server {
    listen 80 default_server;
    listen [::]:80 default_server;
    location / {
      proxy_pass http://localhost:60000;
    }
  }" | sudo tee /etc/nginx/sites-available/default
  sudo service nginx stop && sudo service nginx start

  echo "||||||HADMARINE/devops|||||| - Initialization complete!"
}

execute;
