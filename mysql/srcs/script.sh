#!/bin/sh
/etc/init.d/mariadb setup
/etc/init.d/mariadb start
mysql -u root -e "CREATE USER 'sqatim'@'localhost' IDENTIFIED BY '123456789' ; CREATE DATABASE wordpress; \
GRANT ALL PRIVILEGES ON wordpress.* TO 'sqatim'@'localhost'; FLUSH PRIVILEGES"
tail -f /dev/null
