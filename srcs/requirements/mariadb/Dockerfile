FROM debian:bullseye

ARG WP_ADMIN_USER
ARG WP_ADMIN_PASS
ARG WP_DATABASE

RUN apt-get update -y \
	&&  apt-get upgrade -y \
	&&  apt-get install mariadb-server -y

RUN echo "[mysqld] \n\
	skip-networking=0 \n\
	skip-bind-address" >> /etc/mysql/my.cnf

COPY tools/ /usr/bin/
RUN chmod +x /usr/bin/setup.sh

RUN service mariadb start && setup.sh

CMD ["mysqld_safe"]
