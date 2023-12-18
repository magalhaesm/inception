#!/usr/bin/env bash

shopt -s expand_aliases
alias wp='wp --allow-root'

wp core download --locale="pt_BR"
wp language core activate "pt_BR"

wp config create \
  --dbname="$WP_DATABASE" \
  --dbuser="$WP_USER" \
  --dbpass="$WP_PASSWORD" \
  --dbhost=mariadb \
  --dbprefix="wp_"

wp core install \
  --url=localhost \
  --title="Inception" \
  --admin_user="$WP_USER" \
  --admin_password="$WP_PASSWORD"  \
  --admin_email="$WP_USER@email.com" \
  --skip-email

wp user create marcelo marcelo@email.com \
  --user_pass=wpass \
  --role=subscriber \
  --porcelain

wp plugin install redis-cache --activate
wp config set WP_REDIS_HOST "redis"
wp config set WP_REDIS_PORT 6379
wp config set WP_CACHE true
wp redis enable

php-fpm -F
