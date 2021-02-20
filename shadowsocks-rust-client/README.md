# shadowsocks-rust-client

A lightweight [shadowsocks-rust](https://github.com/shadowsocks/shadowsocks-rust) with just the client binary and [v2ray-plugin](https://github.com/shadowsocks/v2ray-plugin)

## Environment variables

```sh
# REQUIRED
SS_SERVER_IP="<ss_server_ip>"
SS_SERVER_PORT=<ss_server_port>
SS_PASSWORD="<ss_server_password>"
# DEFAULT
SS_TIMEOUT=300
SS_ENCRYPT_METHOD="aes-256-gcm"
# OPTIONAL
SS_PLUGIN="v2ray-plugin"
SS_PLUGIN_OPTS=""
SS_PROTOCOL="redir"
```

## How to use this image

- with docker cli:

```sh
docker run --name ssclient \
  -p 1080:1080 \
  -e SS_SERVER_IP=<ss_server_ip> \
  -e SS_SERVER_PORT=<ss_server_port> \
  -e SS_PASSWORD=<ss_server_password> \
  -d yunielrc/shadowsocks-rust-client
```

- with docker-compose:

ssserver

```yml
version: "3.4"

services:
  ssserver:
    image: yunielrc/shadowsocks-rust-server
    restart: always
    container_name: ssserver
    environment:
      - "SS_PASSWORD=<ss_server_password>"
    ports:
      - "<ss_server_port>:8388/tcp"
      - "<ss_server_port>:8388/udp"
```

ssclient

```yml
version: "3.4"

services:
  ssclient:
    image: yunielrc/shadowsocks-rust-client
    restart: always
    container_name: ssclient
    environment:
      - "SS_SERVER_IP=<ss_server_ip>"
      - "SS_SERVER_PORT=<ss_server_port>"
      - "SS_PASSWORD=<ss_server_password>"
    ports:
      - "1080:1080"
```

```sh
docker-compose up -d
```

## Build Image

```sh
git clone https://github.com/yunielrc/dockerfiles.git
cd dockerfiles/shadowsocks-rust-client
docker build -t your_docker_id/shadowsocks-rust-client .
```
