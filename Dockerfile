FROM bash:latest

ARG TARGETARCH="amd64"
ARG TARGETOS="linux"
ARG TARGETPLATFORM="linux/amd64"

ARG USER_UID=1000
ARG USER_GID=$USER_UID

ADD https://github.com/juev/rss-parser/releases/latest/download/rss-parser-linux-amd64 /app/rss-parser
ADD https://github.com/juev/getpocket-collector/releases/latest/download/getpocket-collector-linux-amd64 /app/getpocket-collector

RUN set -eux; \
    \
    apk add --no-cache curl git; \
    rm -rf /var/cache/apk; \
    \
    addgroup -S runner -g $USER_GID; \
    adduser -S runner -G runner -u $USER_UID; \
    chown -R runner ~runner; \
    chmod +x /app/rss-parser /app/getpocket-collector;

USER runner

WORKDIR /home/runner
