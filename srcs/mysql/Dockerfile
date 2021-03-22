FROM alpine:3.12
RUN echo http://nl.alpinelinux.org/alpine/edge/community >> etc/apk/repositories 
RUN apk update
RUN apk add mysql mysql-client openrc supervisor telegraf
COPY ./srcs/supervisord.conf ./etc
COPY ./srcs/stop-supervisor.sh ./tmp
COPY ./srcs/wordpress.sql .
RUN chmod +x /tmp/stop-supervisor.sh
COPY ./srcs/telegraf.conf ./etc
RUN openrc
RUN touch /run/openrc/softlevel
COPY ./srcs/script.sh .
EXPOSE 3306
CMD sh script.sh
