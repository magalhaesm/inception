FROM debian:bullseye

WORKDIR /var/www/html/

RUN <<EOF
apt-get update -y && apt-get upgrade -y
apt-get install wget php-fpm php-mysql -y
apt-get clean
rm -r /var/lib/apt/lists/*
EOF

RUN <<EOF
sed -i "/^listen\s=.*/c\listen = 0.0.0.0:9000" \
  /etc/php/[0-9]*.[0-9]*/fpm/pool.d/www.conf

mkdir -p /run/php
ln -s $(find /usr/sbin -name 'php-fpm*') /usr/bin/php-fpm
EOF

RUN <<EOF
wget "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
EOF

COPY tools/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT ["/tmp/entrypoint.sh"]
