#!/bin/bash

if [ "$EUID" -ne 0 ]; then
   exit 1
fi

echo 'Acquire::http::Pipeline-Depth "5";' > /etc/apt/apt.conf.d/99parallel

apt update

sudo apt install --no-install-recommends syncthing