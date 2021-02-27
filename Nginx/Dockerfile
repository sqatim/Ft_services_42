FROM alpine:3.12
RUN apk update
RUN apk add nginx
RUN apk add openrc 
RUN openrc
RUN touch /run/openrc/softlevel
#RUN mkdir -p /run/nginx
#CMD noginx -g 'daemon off;'
COPY ./srcs/index.html .
COPY ./srcs/nginx.conf .
COPY ./script.sh .
RUN chmod 777 script.sh
expose 80
expose 443
CMD sh script.sh
