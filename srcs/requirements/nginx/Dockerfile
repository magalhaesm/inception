FROM debian:bullseye

RUN <<EOF
apt-get update -y && apt-get upgrade -y
apt-get install nginx openssl -y
EOF

RUN openssl req -batch -x509 \
  -sha256 -nodes -newkey rsa:4096 -days 365 \
  -out /etc/ssl/certs/nginx-selfsigned.crt \
  -keyout /etc/ssl/private/nginx-selfsigned.key \
  -subj "/O=42sp/OU=42 Sao Paulo/CN=42sp.org.br"

COPY conf/wordpress.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]