FROM alpine:3.12
RUN apk update
RUN apk add vsftpd
RUN apk add openrc
RUN apk add openssl
RUN openrc
RUN touch /run/openrc/softlevel
COPY ./srcs/script.sh .
COPY ./srcs/vsftpd.conf /etc/vsftpd/
RUN echo -e "123456789\n123456789" | adduser sqatim
RUN echo "sqatim" | tee -a /etc/vsftpd.userlist
RUN	 openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
expose 21
CMD sh /script.sh
