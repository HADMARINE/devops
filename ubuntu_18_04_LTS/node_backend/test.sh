#!/bin/sh

function execute() {
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
}

exeucte;
