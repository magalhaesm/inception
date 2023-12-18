FROM debian:bullseye

RUN <<EOF
apt-get update -y && apt-get upgrade -y
apt-get install redis-server -y
apt-get clean
rm -r /var/lib/apt/lists/*
EOF

RUN <<EOF
echo "maxmemory 256mb" >> /etc/redis/redis.conf
echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf
sed -i -r "s/bind 127.0.0.1/#bind 127.0.0.1/" /etc/redis/redis.conf
EOF

CMD ["redis-server", "--protected-mode", "no"]
