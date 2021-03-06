# shadowsocks-rust-server

A lightweight [shadowsocks-rust](https://github.com/shadowsocks/shadowsocks-rust) with just the server binary and [v2ray-plugin](https://github.com/shadowsocks/v2ray-plugin)

[shadowsocks-rust-client on docker hub](https://hub.docker.com/r/yunielrc/shadowsocks-rust-client)

## Environment variables

```sh
# REQUIRED
SS_PASSWORD="<ss_server_password>"
# DEFAULT
SS_TIMEOUT=300
SS_ENCRYPT_METHOD="aes-256-gcm"
# OPTIONAL
SS_NAMESERVER="1.1.1.1"
SS_PLUGIN="v2ray-plugin"
SS_PLUGIN_OPTS="server"
```

## How to use this image

### With docker cli

```sh
docker run --name ssserver \
  -p 8388:8388/tcp \
  -p 8388:8388/udp \
  -e SS_PASSWORD=<ss_server_password> \
  -d yunielrc/shadowsocks-rust-server
```

**Using v2ray-plugin:**

```sh
docker run --name ssserver \
  -p 8388:8388/tcp \
  -p 8388:8388/udp \
  -e SS_PASSWORD=<ss_server_password> \
  -e SS_PLUGIN=v2ray-plugin \
  -e SS_PLUGIN_OPTS=server \
  -d yunielrc/shadowsocks-rust-server
```

### With docker-compose

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

**Using v2ray-plugin:**

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
      - "SS_PLUGIN=v2ray-plugin"
      - "SS_PLUGIN_OPTS=server"
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
      - "SS_PLUGIN=v2ray-plugin"
    ports:
      - "1080:1080"
```

```sh
docker-compose up -d
```

## Build Image

```sh
git clone https://github.com/yunielrc/dockerfiles.git
cd dockerfiles/shadowsocks-rust-server
docker build -t your_docker_id/shadowsocks-rust-server .
```
