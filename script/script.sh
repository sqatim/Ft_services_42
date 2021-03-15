#!/bin/sh
#minikube start
docker build -t nginx:service ./Nginx/
docker build -t phpmyadmin:service ./PhpMyAdmin/
docker build -t wordpress:service ./WordPress/
docker build -t ftps:service ./ftps/
docker build -t mysql:service ./mysql/
./script/script_k8s.sh
minikube dashboard
