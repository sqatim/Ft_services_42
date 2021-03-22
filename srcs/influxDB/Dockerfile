FROM alpine:3.12
RUN echo http://nl.alpinelinux.org/alpine/edge/community >> etc/apk/repositories 
RUN apk update
RUN apk add influxdb supervisor telegraf
COPY ./srcs/supervisord.conf ./etc
COPY ./srcs/telegraf.conf ./etc
COPY ./srcs/stop-supervisor.sh ./tmp
RUN chmod +x /tmp/stop-supervisor.sh
CMD ./usr/bin/supervisord -c etc/supervisord.conf
