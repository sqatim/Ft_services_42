#!/bin/sh
kubectl delete -f Nginx/yamlconfig/nginx_deployment.yaml
kubectl delete -f Nginx/yamlconfig/nginx_service.yaml
kubectl delete -f PhpMyAdmin/yamlconfig/phpmyadmin_deployment.yaml
kubectl delete -f PhpMyAdmin/yamlconfig/phpmyadmin_service.yaml
kubectl delete -f WordPress/yamlconfig/wordpress_deployment.yaml
kubectl delete -f WordPress/yamlconfig/wordpress_service.yaml
kubectl delete -f ftps/yamlconfig/ftps_deployment.yaml
kubectl delete -f ftps/yamlconfig/ftps_service.yaml

