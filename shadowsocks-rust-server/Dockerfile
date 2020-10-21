# build stage
FROM alpine:latest AS builder
RUN apk add --no-cache ca-certificates wget \
 && update-ca-certificates \
 && mkdir releases
WORKDIR /releases
RUN wget -qO - 'https://api.github.com/repos/shadowsocks/shadowsocks-rust/releases/latest' \
  | grep -om 1 'https://.*shadowsocks.*x86_64-unknown-linux-musl.tar.xz' \
  | wget -qO - -i - \
  | tar xJf -

# final stage
FROM alpine:latest AS release
RUN apk add --no-cache ca-certificates gettext \
  && mkdir /etc/shadowsocks-rust-server
COPY --from=builder /releases/ssserver /usr/bin/ssserver
COPY root /
ENTRYPOINT /usr/bin/ssserver-wrap
EXPOSE 8388
