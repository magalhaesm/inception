FROM debian:bullseye

WORKDIR /var/www/html/

RUN <<EOF
apt-get update -y && apt-get upgrade -y
apt-get install wget php-fpm php-mysql -y
EOF

RUN <<EOF
sed -i "/^listen\s=.*/c\listen = 0.0.0.0:9000" \
  /etc/php/[0-9]*.[0-9]*/fpm/pool.d/www.conf

mkdir -p /run/php
ln -s $(find /usr/sbin -name 'php-fpm*') /usr/bin/php-fpm
EOF

COPY tools/setup.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh

ENTRYPOINT ["/tmp/setup.sh"]
