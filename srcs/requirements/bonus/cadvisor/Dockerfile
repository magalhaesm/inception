FROM debian:bullseye

RUN apt-get update -y \
&&  apt-get install wget -y \
&&  wget -O cadvisor \
    https://github.com/google/cadvisor/releases/download/v0.47.2/cadvisor-v0.47.2-linux-amd64 \
&&  chmod +x cadvisor \
&&  mv cadvisor /usr/local/bin/cadvisor

CMD ["cadvisor"]
