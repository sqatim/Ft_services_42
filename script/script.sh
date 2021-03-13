#!/bin/sh
docker build -t nginx:service ./Nginx/
docker build -t phpmyadmin:service ./PhpMyAdmin/
docker build -t wordpress:service ./WordPress/
docker build -t ftps:service ./ftps/
./script_k8s.sh
