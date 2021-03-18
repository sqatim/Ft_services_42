FROM alpine:3.12
RUN apk update
RUN apk add supervisor openssl
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
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;
expose 80
expose 443
CMD /usr/bin/supervisord -c /etc/supervisord.conf 
