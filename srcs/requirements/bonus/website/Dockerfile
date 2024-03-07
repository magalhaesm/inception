FROM debian:bullseye

ENV PATH=$PATH:/usr/local/go/bin
ARG GO_PACKAGE_FILE=go1.21.5.linux-amd64.tar.gz

RUN apt-get update -y \
&&  apt-get upgrade -y \
&&  apt-get install wget -y

RUN wget https://go.dev/dl/${GO_PACKAGE_FILE} \
&&  rm -rf /usr/local/go \
&&  tar -C /usr/local -xzf ${GO_PACKAGE_FILE} \
&&  rm ${GO_PACKAGE_FILE}

WORKDIR /app
COPY ./conf/ .

CMD ["go", "run", "./cmd/web/"]
