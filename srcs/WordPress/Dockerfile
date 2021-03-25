FROM alpine:3.12
RUN echo http://nl.alpinelinux.org/alpine/edge/community >> etc/apk/repositories 
RUN apk update
RUN apk add nginx && \
    mkdir -p /run/nginx
RUN apk add  php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN apk add supervisor telegraf
COPY ./srcs/nginx.conf .
COPY ./srcs/supervisord.conf /etc/
COPY ./srcs/stop-supervisor.sh /tmp
RUN chmod +x /tmp/stop-supervisor.sh
COPY ./srcs/telegraf.conf ./etc
COPY ./srcs/wp-config.php .
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mv ./nginx.conf /etc/nginx/nginx.conf
WORKDIR /www/
RUN wget http://wordpress.org/latest.tar.gz &&\
tar -xzvf latest.tar.gz &&\
 rm latest.tar.gz && \
 rm wordpress/wp-config-sample.php && \
 mv /wp-config.php ./wordpress/ && \
 cd ..
expose 5050
CMD /usr/bin/supervisord -c /etc/supervisord.conf 
