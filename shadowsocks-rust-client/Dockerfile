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
  && mkdir /etc/sslocal

COPY --from=builder /releases/sslocal /usr/bin/sslocal
COPY --from=builder /releases/v2ray-plugin_linux_amd64 /usr/bin/v2ray-plugin

COPY root /

# REQUIRED
# ENV SS_SERVER_IP="<ss_server_ip>"
# ENV SS_SERVER_PORT=<ss_server_port>
# ENV SS_PASSWORD="<ss_server_password>"
# DEFAULT
ENV SS_TIMEOUT=300
ENV SS_ENCRYPT_METHOD="aes-256-gcm"
# OPTIONAL
# ENV SS_PLUGIN="v2ray-plugin"
# ENV SS_PLUGIN_OPTS=""
# ENV SS_PROTOCOL="redir"

EXPOSE 1080

CMD [ "run-sslocal" ]
