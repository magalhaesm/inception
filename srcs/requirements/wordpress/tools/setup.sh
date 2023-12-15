#!/usr/bin/env bash

wget "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"
chmod +x wp-cli.phar
mv wp-cli.phar /usr/bin/wp

wp core download --allow-root
wp language core install "pt_BR" --activate --allow-root

wp config create --allow-root \
  --dbname="$WP_DATABASE" \
  --dbuser="$WP_USER" \
  --dbpass="$WP_PASSWORD" \
  --dbhost=mariadb \
  --dbprefix="wp_" \

wp core install \
  --url=localhost \
  --title="Inception" \
  --admin_user="$WP_USER" \
  --admin_password="$WP_PASSWORD"  \
  --admin_email="$WP_USER@email.com" \
  --skip-email --allow-root

wp user create marcelo marcelo@email.com \
  --user_pass=wpass \
  --role=subscriber \
  --porcelain --allow-root

php-fpm -F
