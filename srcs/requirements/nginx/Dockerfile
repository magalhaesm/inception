FROM debian:bullseye

RUN <<EOF
apt-get update -y && apt-get upgrade -y
apt-get install nginx openssl -y
apt-get clean
rm -r /var/lib/apt/lists/*
EOF

RUN <<EOF
openssl req -batch -x509 \
  -sha256 -nodes -newkey rsa:4096 -days 365 \
  -out /etc/ssl/certs/nginx-selfsigned.crt \
  -keyout /etc/ssl/private/nginx-selfsigned.key \
  -subj "/O=42sp/OU=42 Sao Paulo/CN=42sp.org.br"
EOF

COPY conf/* /etc/nginx/conf.d

CMD ["nginx", "-g", "daemon off;"]
