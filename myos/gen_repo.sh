#!/bin/bash
set -e

PROXY=192.168.1.252

docker run -itd --rm --name linux rockylinux:8.5
docker cp linux:/etc/yum.repos.d/ .

rm -f yum.repos.d/Rocky-[!ABE]*

sed -e 's|^mirrorlist=|#mirrorlist=|g' \
    -e "s|^#baseurl=http://dl.rockylinux.org/\$contentdir|baseurl=http://$PROXY/rockylinux|g" \
    -i yum.repos.d/Rocky-*.repo

cat > yum.repos.d/local.repo << EOF
[localrepo]
name=Rocky Linux \$releasever - LocalRepo
baseurl=http://$PROXY/localrepo
gpgcheck=0
EOF

tar czf repos.tar.gz -C yum.repos.d/ .
tar tf repos.tar.gz

docker stop linux
rm -rf yum.repos.d/
