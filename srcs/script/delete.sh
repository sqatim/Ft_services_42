#!/bin/sh
kubectl delete -f yaml_config/metallb_config.yaml
kubectl delete -f yaml_config/Nginx/nginx_deployment.yaml
kubectl delete -f yaml_config/Nginx/nginx_service.yaml
kubectl delete -f yaml_config/PhpMyAdmin/phpmyadmin_deployment.yaml
kubectl delete -f yaml_config/PhpMyAdmin/phpmyadmin_service.yaml
kubectl delete -f yaml_config/WordPress/wordpress_deployment.yaml
kubectl delete -f yaml_config/WordPress/wordpress_service.yaml
kubectl delete -f yaml_config/ftps/ftps_deployment.yaml
kubectl delete -f yaml_config/ftps/ftps_service.yaml
kubectl delete -f yaml_config/mysql/mysql_deployment.yaml
kubectl delete -f yaml_config/mysql/mysql_service.yaml
kubectl delete -f yaml_config/mysql/mysql_volume.yaml
