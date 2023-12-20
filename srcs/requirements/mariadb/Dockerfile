FROM debian:bullseye

ARG WP_ADMIN_USER
ARG WP_ADMIN_PASS
ARG WP_DATABASE

RUN <<EOF
apt-get update -y && apt-get upgrade -y
apt-get install mariadb-server -y
apt-get clean
rm -r /var/lib/apt/lists/*
EOF

RUN echo "[mysqld] \n\
skip-networking=0 \n\
skip-bind-address" >> /etc/mysql/my.cnf

RUN <<EOF
service mariadb start
mariadb -u root -p"$WP_ADMIN_PASS" << eof
CREATE DATABASE IF NOT EXISTS $WP_DATABASE;
CREATE USER '$WP_ADMIN_USER'@'%' IDENTIFIED BY '$WP_ADMIN_PASS';
GRANT ALL ON $WP_DATABASE.* TO '$WP_ADMIN_USER'@'%';
FLUSH PRIVILEGES;
eof
EOF

CMD ["mysqld_safe"]
