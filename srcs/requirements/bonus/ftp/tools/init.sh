#!/usr/bin/env bash

chmod g+w "/home/vsftpd"

exec "$@"
