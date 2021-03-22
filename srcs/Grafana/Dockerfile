FROM alpine:3.12
RUN echo http://nl.alpinelinux.org/alpine/edge/community >> etc/apk/repositories 
RUN apk update
RUN apk add libc6-compat supervisor telegraf
RUN wget https://dl.grafana.com/oss/release/grafana-7.3.10.linux-amd64.tar.gz && \
    tar -zxvf grafana-7.3.10.linux-amd64.tar.gz && \
    rm -rf grafana-7.3.10.linux-amd64.tar.gz && \
    mv grafana-7.3.10 grafana
COPY srcs/supervisord.conf /grafana/
COPY srcs/grafana.db /grafana/data/
COPY srcs/sample.yaml /grafana/conf/provisioning/datasources
COPY ./srcs/telegraf.conf ./etc
COPY ./srcs/stop-supervisor.sh ./tmp
WORKDIR /grafana/
expose 3000
CMD /usr/bin/supervisord -c /grafana/supervisord.conf 

#apk add --update binutils | readelf -l /grafana-7.3.10/bin/grafana-server | grep "program interpreter"