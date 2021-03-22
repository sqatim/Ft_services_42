FROM alpine:3.12
RUN echo http://nl.alpinelinux.org/alpine/edge/community >> etc/apk/repositories 
RUN apk update
RUN apk add nginx && \
    mkdir -p /run/nginx
RUN apk add phpmyadmin php7-fpm supervisor telegraf
COPY ./srcs/nginx.conf .
COPY ./srcs/supervisord.conf /etc/
COPY ./srcs/stop-supervisor.sh /tmp
RUN chmod +x /tmp/stop-supervisor.sh
COPY ./srcs/telegraf.conf ./etc
COPY ./srcs/config.inc.php .
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mv ./nginx.conf /etc/nginx/nginx.conf
WORKDIR /www/
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz &&\
tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz &&\
rm phpMyAdmin-5.0.2-all-languages.tar.gz && \
mv phpMyAdmin-5.0.2-all-languages phpmyadmin && \
rm phpmyadmin/config.sample.inc.php && \
mv /config.inc.php ./phpmyadmin/
WORKDIR /
expose 5000
CMD /usr/bin/supervisord -c /etc/supervisord.conf 
