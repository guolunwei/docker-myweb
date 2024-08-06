#!/bin/bash
set -e

tar czf myweb.tar.gz index.html info.php
docker build -t myos:httpd .
rm -f myweb.tar.gz
