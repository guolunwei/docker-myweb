#!/bin/bash
set -e

if [ ! -f nginx-1.22.1.tar.gz ]; then
     wget https://nginx.org/download/nginx-1.22.1.tar.gz
fi
docker build -t myos:nginx .
