#!/bin/bash
set -e

./gen_repo.sh > /dev/null 2>&1
docker build -t myos:8.5 .
rm -f repos.tar.gz
