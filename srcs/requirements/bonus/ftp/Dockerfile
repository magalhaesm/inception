FROM debian:bullseye

ARG FTP_USER
ARG FTP_PASS

RUN apt-get update -y \
&&  apt-get upgrade -y \
&&  apt-get install -y vsftpd

RUN useradd --gid 0 -m "${FTP_USER}" -s /bin/bash \
&&  echo "${FTP_USER}:${FTP_PASS}" | chpasswd

COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY ./tools/init.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init.sh

RUN mkdir -p /var/run/vsftpd/empty

EXPOSE 20 21 42000-42005

ENTRYPOINT ["init.sh"]

CMD ["vsftpd"]
