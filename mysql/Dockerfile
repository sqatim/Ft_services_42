FROM alpine:3.12
RUN apk update
RUN apk add mysql mysql-client openrc supervisor
COPY ./supervisord.conf ./etc
COPY ./stop-supervisor.sh ./tmp
RUN chmod +x /tmp/stop-supervisor.sh
RUN openrc
RUN touch /run/openrc/softlevel
COPY ./srcs/script.sh .
EXPOSE 3306
CMD sh script.sh
