FROM alpine:3.12
RUN apk update
RUN apk add nginx
RUN apk add  php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN apk add openrc
RUN openrc
RUN touch /run/openrc/softlevel
COPY ./srcs/nginx.conf .
COPY ./srcs/script.sh .
RUN chmod 777 script.sh
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mv ./nginx.conf /etc/nginx/nginx.conf
WORKDIR /www/
RUN wget http://wordpress.org/latest.tar.gz &&\
tar -xzvf latest.tar.gz &&\
 rm latest.tar.gz
expose 5050
CMD sh /script.sh
