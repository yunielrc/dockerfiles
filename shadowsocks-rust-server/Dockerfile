# build stage
FROM alpine:latest AS builder

RUN apk add --no-cache \
  ca-certificates wget \
  && update-ca-certificates \
  && mkdir releases

WORKDIR /releases

RUN wget -qO - 'https://api.github.com/repos/shadowsocks/shadowsocks-rust/releases/latest' \
  | grep -om 1 'https://.*shadowsocks.*x86_64-unknown-linux-musl.tar.xz' \
  | wget -qO - -i - \
  | tar xJf -
RUN wget -qO - 'https://api.github.com/repos/shadowsocks/v2ray-plugin/releases/latest' \
  | grep -om 1 'https://.*v2ray-plugin-linux-amd64-.*.tar.gz' \
  | wget -qO - -i - \
  | tar xzf -

# final stage
FROM alpine:latest AS release

RUN apk add --no-cache \
  ca-certificates \
  gettext \
  && mkdir /etc/ssserver

COPY --from=builder /releases/ssserver /usr/bin/ssserver
COPY --from=builder /releases/v2ray-plugin_linux_amd64 /usr/bin/v2ray-plugin

COPY root /

ENV SS_ADDR="0.0.0.0"
ENV SS_PORT=8388
# ENV SS_PASSWORD="your_password"
ENV SS_TIMEOUT=300
ENV SS_ENCRYPT_METHOD="aes-256-gcm"
# ENV SS_NAMESERVER="1.1.1.1"
# ENV SS_PLUGIN="v2ray-plugin"
# ENV SS_PLUGIN_OPTS="server"

EXPOSE $SS_PORT

CMD [ "/usr/bin/run-ssserver" ]
