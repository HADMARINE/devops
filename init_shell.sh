mkdir scripts

echo '
#!/bin/sh

echo "This Shell Script works on Ubuntu 18.04 LTS"

# Install Critical packages
sudo apt update
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
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

echo "Initialization complete!"
' > ./scripts/initialize.sh

echo '
#!/bin/sh

mkdir node_test && cd node_test
echo "
var http = require('http');

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello World!');
}).listen(60000);
" > index.js
npm init -y
cd ..
echo "Start example server on port 60000"
sudo node node_test/index.js
' > ./scripts/test_node.sh

chmod -R +x scripts/

echo "Created shell scripts"
