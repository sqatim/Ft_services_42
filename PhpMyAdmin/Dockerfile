FROM alpine:3.12
RUN apk update
RUN apk add nginx && \
    mkdir -p /run/nginx
RUN apk add phpmyadmin php7-fpm
RUN apk add supervisor
COPY ./srcs/nginx.conf .
COPY ./srcs/supervisord.conf ./etc/
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mv ./nginx.conf /etc/nginx/nginx.conf
WORKDIR /www/
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz &&\
tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz &&\
rm phpMyAdmin-5.0.2-all-languages.tar.gz &&\
mv phpMyAdmin-5.0.2-all-languages phpmyadmin
expose 5000
CMD /usr/bin/supervisord -c /etc/supervisord.conf 
