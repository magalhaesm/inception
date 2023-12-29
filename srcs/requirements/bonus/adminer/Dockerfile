FROM debian:bullseye

RUN apt-get update -y \
&&  apt-get upgrade -y \
&&  apt-get install adminer -y

CMD ["php", "-S", "[::]:8081", "/usr/share/adminer/adminer.php"]
