FROM debian:bullseye

ARG FTP_USER
ARG FTP_PASS

RUN apt-get update -y && apt-get upgrade -y \
&&  apt-get install -y vsftpd \
&&  apt-get clean \
&&  rm -r /var/lib/apt/lists/*

RUN useradd -m "${FTP_USER}" -s /bin/bash \
&&  echo "${FTP_USER}:${FTP_PASS}" | chpasswd

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

RUN mkdir -p /var/run/vsftpd/empty

EXPOSE 20 21 42000-42005

CMD ["vsftpd"]
