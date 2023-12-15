FROM debian:bullseye

ARG WP_USER
ARG WP_PASSWORD
ARG WP_DATABASE

RUN <<EOF
apt-get update -y && apt-get upgrade -y
apt-get install mariadb-server -y
EOF

RUN echo "[mysqld] \n\
skip-networking=0 \n\
skip-bind-address" >> /etc/mysql/my.cnf

RUN <<EOF
service mariadb start
mariadb -u root -p"${WP_PASSWORD}" << eof
CREATE DATABASE IF NOT EXISTS ${WP_DATABASE};
CREATE USER '${WP_USER}'@'%' IDENTIFIED BY '${WP_PASSWORD}';
GRANT ALL ON ${WP_DATABASE}.* TO '${WP_USER}'@'%';
FLUSH PRIVILEGES;
eof
EOF

CMD ["mysqld_safe"]
