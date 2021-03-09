FROM alpine:3.12
RUN apk update
RUN apk add supervisor
RUN apk add nginx && \
    mkdir -p /run/nginx
COPY ./srcs/index.html .
COPY ./srcs/nginx.conf .
COPY ./srcs/supervisord.conf ./etc/
RUN adduser -D -g 'www' www && \
    mkdir /www && \
    chown -R www:www /var/lib/nginx && \
    chown -R www:www /www && \
    mv ./nginx.conf /etc/nginx/nginx.conf && \
    mv ./index.html /www
CMD /usr/bin/supervisord -c /etc/supervisord.conf 
