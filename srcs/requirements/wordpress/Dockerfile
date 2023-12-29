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

RUN <<EOF
wget "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
EOF

COPY tools/wp_setup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wp_setup.sh

ENTRYPOINT ["wp_setup.sh"]

CMD ["php-fpm", "-F"]
