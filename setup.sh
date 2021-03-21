#!/bin/sh
# minikube start
eval $(minikube -p minikube docker-env)
docker build -t nginx:service ./srcs/Nginx/
docker build -t phpmyadmin:service ./srcs/PhpMyAdmin/
docker build -t wordpress:service ./srcs/WordPress/
docker build -t ftps:service ./srcs/ftps/
docker build -t mysql:service ./srcs/mysql/
docker build -t grafana:service ./srcs/Grafana/
docker build -t influxdb:service ./srcs/influxDB/
echo "deployment"
sleep 3
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/yaml_config/metallb_config.yaml
kubectl apply -f srcs/yaml_config/Nginx/nginx_deployment.yaml
kubectl apply -f srcs/yaml_config/Nginx/nginx_service.yaml
kubectl apply -f srcs/yaml_config/PhpMyAdmin/phpmyadmin_deployment.yaml
kubectl apply -f srcs/yaml_config/PhpMyAdmin/phpmyadmin_service.yaml
kubectl apply -f srcs/yaml_config/WordPress/wordpress_deployment.yaml
kubectl apply -f srcs/yaml_config/WordPress/wordpress_service.yaml
kubectl apply -f srcs/yaml_config/ftps/ftps_deployment.yaml
kubectl apply -f srcs/yaml_config/ftps/ftps_service.yaml
kubectl apply -f srcs/yaml_config/mysql/mysql_volume.yaml
kubectl apply -f srcs/yaml_config/mysql/mysql_deployment.yaml
kubectl apply -f srcs/yaml_config/mysql/mysql_service.yaml
kubectl apply -f srcs/yaml_config/Grafana/grafana_deployment.yaml
kubectl apply -f srcs/yaml_config/Grafana/grafana_service.yaml
kubectl apply -f srcs/yaml_config/influxDB/influxdb_volume.yaml
kubectl apply -f srcs/yaml_config/influxDB/influxdb_deployment.yaml
kubectl apply -f srcs/yaml_config/influxDB/influxdb_service.yaml

echo "run minikube dashboard"
sleep 120
minikube dashboard
