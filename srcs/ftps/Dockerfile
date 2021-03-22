FROM alpine:3.12
RUN echo http://nl.alpinelinux.org/alpine/edge/community >> etc/apk/repositories 
RUN apk update
RUN apk add vsftpd supervisor openssl telegraf
COPY ./srcs/supervisord.conf ./etc/
COPY ./srcs/stop-supervisor.sh ./tmp
COPY ./srcs/telegraf.conf ./etc
COPY ./srcs/vsftpd.conf /etc/vsftpd/
RUN echo -e "123456789\n123456789" | adduser sqatim
RUN echo "sqatim" | tee -a /etc/vsftpd.userlist
RUN	 openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
expose 21
CMD /usr/bin/supervisord -c /etc/supervisord.conf
