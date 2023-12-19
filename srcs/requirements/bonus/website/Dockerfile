FROM debian:bullseye

ENV PATH=$PATH:/usr/local/go/bin
ARG GO_PACKAGE_FILE=go1.21.5.linux-amd64.tar.gz

RUN <<EOF
apt-get update -y && apt-get upgrade -y
apt-get install wget -y
apt-get clean
rm -r /var/lib/apt/lists/*
EOF

RUN <<EOF
wget https://go.dev/dl/${GO_PACKAGE_FILE}
rm -rf /usr/local/go
tar -C /usr/local -xzf ${GO_PACKAGE_FILE}
rm ${GO_PACKAGE_FILE}
EOF

WORKDIR /app
COPY conf/ .
RUN go build -o webserver ./cmd/web/

CMD ["./webserver"]
