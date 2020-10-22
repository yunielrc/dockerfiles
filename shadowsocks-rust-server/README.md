# shadowsocks-rust-server

[A Rust port of shadowsocks](https://github.com/shadowsocks/shadowsocks-rust)

## How to use this image

```sh
docker run --name shadowsocks-rust-server \
  -p 443:8388 \
  -e SS_PASSWORD=mypassword \
  -d yunielrc/shadowsocks-rust-server
```

with docker-compose:

```sh
cd shadowsocks-rust-server
nano data/config.json
docker-compose up -d
```

## Build

```sh
cd shadowsocks-rust-server
docker build -t your_docker_id/shadowsocks-rust-server .
```

## Environment variables

Below the variables with example values

- Server address

```sh
SS_ADDR="0.0.0.0"
```

- Server port

```sh
SS_PORT=8388
```

- Server password

```sh
SS_PASSWORD="your_password"

```

- Server's timeout seconds for TCP relay

```sh
SS_TIMEOUT=300
```

- Server's encryption method

Possible values: table, plain, none, aes-128-cfb, aes-128-cfb1, aes-128-cfb8, aes-128-cfb128, aes-192-
cfb, aes-192-cfb1, aes-192-cfb8, aes-192-cfb128, aes-256-cfb, aes-256-cfb1, aes-256-cfb8, aes-256-cfb128, aes-128-ctr, aes-
192-ctr, aes-256-ctr, rc4, rc4-md5, chacha20, salsa20, xsalsa20, chacha20-ietf, aes-128-gcm, aes-256-gcm, chacha20-ietf-
poly1305, xchacha20-ietf-poly1305, aes-128-pmac-siv, aes-256-pmac-siv

```sh
SS_ENCRYPT_METHOD="aes-256-gcm"

```

- Nameserver

```sh
SS_NAMESERVER="1.1.1.1"

```

- [SIP003](https://shadowsocks.org/en/spec/Plugin.html) plugin

```sh
SS_PLUGIN="v2ray-plugin"

```

- Set SIP003 plugin options

```sh
SS_PLUGIN_OPTS="server"
```
