FROM bash:latest

ARG TARGETARCH="amd64"
ARG TARGETOS="linux"
ARG TARGETPLATFORM="linux/amd64"

ARG USER_UID=1001
ARG USER_GID=123

ADD https://github.com/juev/rss-parser/releases/latest/download/rss-parser-linux-amd64 /app/rss-parser
ADD https://github.com/juev/getpocket-collector/releases/latest/download/getpocket-collector-linux-amd64 /app/getpocket-collector

RUN set -eux; \
    \
    apk add --no-cache curl git jq gpg; \
    rm -rf /var/cache/apk; \
    \
    # addgroup -S docker -g $USER_GID; \
    # mkdir -p /github/home; \
    # adduser -S runner -G docker -u $USER_UID -h /github/home; \
    adduser -D runner -u $USER_UID; \
    # chown -R runner ~runner; \
    chmod +x /app/rss-parser /app/getpocket-collector;

USER runner

