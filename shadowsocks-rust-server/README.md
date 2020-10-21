# shadowsocks-rust-server

## About

shadowsocks-rust-server docker

### Prerequisites

[Install docker](https://docs.docker.com/engine/install)

### How to use this image

with docker:

```sh
cd shadowsocks-rust-server
docker run --name shadowsocks-rust-server -e SS_PASSWORD=mypassword -d yunielrc/shadowsocks-rust-server
```

with docker-compose:

```sh
cd shadowsocks-rust-server
nano config.json
docker-compose up -d
```

### Build

with docker:

```sh
cd shadowsocks-rust-server
docker build -t your_docker_id/shadowsocks-rust-server .
docker run --name shadowsocks-rust-server -e SS_PASSWORD=mypassword -d your_docker_id/shadowsocks-rust-server
```
