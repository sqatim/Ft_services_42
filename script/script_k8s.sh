#!/bin/sh
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f yaml_config/metallb_config.yaml
kubectl apply -f yaml_config/Nginx/nginx_deployment.yaml
kubectl apply -f yaml_config/Nginx/nginx_service.yaml
kubectl apply -f yaml_config/PhpMyAdmin/phpmyadmin_deployment.yaml
kubectl apply -f yaml_config/PhpMyAdmin/phpmyadmin_service.yaml
kubectl apply -f yaml_config/WordPress/wordpress_deployment.yaml
kubectl apply -f yaml_config/WordPress/wordpress_service.yaml
kubectl apply -f yaml_config/ftps/ftps_deployment.yaml
kubectl apply -f yaml_config/ftps/ftps_service.yaml
kubectl apply -f yaml_config/mysql/mysql_volume.yaml
kubectl apply -f yaml_config/mysql/mysql_deployment.yaml
kubectl apply -f yaml_config/mysql/mysql_service.yaml
