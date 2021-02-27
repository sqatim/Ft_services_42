#!/bin/sh
adduser -D -g 'www' www
mkdir /www
chown -R www:www /var/lib/nginx
chown -R www:www /www
mv ./nginx.conf /etc/nginx/nginx.conf
mv ./index.html /www

 rc-service php-fpm7 start
 rc-service nginx start

 /bin/sh
