# dockerfile for web

```
docker images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
myos         php-fpm   7211437e461d   8 minutes ago    275MB
myos         nginx     61b70a227d8f   9 minutes ago    274MB
myos         httpd     68c102f22ac9   11 minutes ago   299MB
myos         8.5       4087efc5e303   13 minutes ago   250MB
rockylinux   8.5       210996f98b85   2 years ago      205MB
```

## Usage

create webroot for web pages

```shell
mkdir /var/webroot
cp apache/{index.html,info.php} /var/webroot
```

for httpd:

```shell
docker run -itd --rm --name apache -p 8080:80 -v /var/webroot:/var/www/html myos:httpd
```

for nginx:

copy nginx conf directory from a temporary container

```shell
docker run -itd --rm --name web myos:nginx
docker cp web:/usr/local/nginx/conf /root
docker stop web
```

modify conf/nginx.conf as below

```shell
        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
        #
        location ~ \.php$ {
            root           html;
            fastcgi_pass   127.0.0.1:9000;
            fastcgi_index  index.php;
            #fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
            include        fastcgi.conf;
        }
```

run nginx and php-fpm container, the php-fpm use the same network with nginx

```shell
docker run -itd --rm --name web -p 80:80 \
           -v /root/conf:/usr/local/nginx/conf \
           -v /var/webroot:/usr/local/nginx/html \
           nginx:latest

docker run -itd --rm --name php --network=container:web \
           -v /var/webroot:/usr/local/nginx/html \
           php-fpm:latest
```

or you can use docker-compose to run nginx and php-fpm containers.

```shell
docker compose -f docker-compose.yaml up -d
```

## Test

```
curl http://127.0.0.1:8080/index.html
curl http://127.0.0.1:8080/info.php

curl http://127.0.0.1/index.html
curl http://127.0.0.1/info.php
```
