FROM debian:bullseye

RUN apt-get update -y \
&&  apt-get upgrade -y \
&&  apt-get install procps redis-server -y

COPY ./tools/init.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init.sh

ENTRYPOINT ["init.sh"]

CMD ["redis-server"]
