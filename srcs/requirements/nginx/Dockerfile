FROM debian:bullseye

ARG LOGIN

RUN apt-get update -y \
	&&  apt-get upgrade -y \
	&&  apt-get install nginx openssl -y

RUN openssl req -batch -x509 \
	-sha256 -nodes -newkey rsa:4096 -days 365 \
	-out /etc/ssl/certs/nginx-selfsigned.crt \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-subj "/O=42sp/OU=42 Sao Paulo/CN=42sp.org.br"

COPY ./conf/https.conf /etc/nginx/conf.d/
COPY ./conf/ssl.conf /etc/nginx/snippets/

RUN sed -i "s/LOGIN/${LOGIN}/g" /etc/nginx/conf.d/https.conf

CMD ["nginx", "-g", "daemon off;"]
