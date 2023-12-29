#!/usr/bin/env bash

shopt -s expand_aliases
alias wp='wp --allow-root'

wp core download --locale="pt_BR"

wp config create \
  --dbname="$WP_DATABASE" \
  --dbuser="$WP_ADMIN_USER" \
  --dbpass="$WP_ADMIN_PASS" \
  --dbhost=mariadb \
  --dbprefix="wp_"

wp core install \
  --url="$DOMAIN" \
  --title="$WP_TITLE" \
  --admin_user="$WP_ADMIN_USER" \
  --admin_password="$WP_ADMIN_PASS" \
  --admin_email="$WP_ADMIN_EMAIL" \
  --skip-email

wp user create "$WP_USER" "$WP_USER_EMAIL" \
  --user_pass="$WP_USER_PASS" \
  --role=subscriber \
  --porcelain

wp theme activate twentytwentytwo

wp plugin install redis-cache --activate
wp config set WP_REDIS_HOST "redis"
wp config set WP_REDIS_PORT 6379
wp config set WP_CACHE true
wp redis enable

exec "$@"
