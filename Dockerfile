FROM bash:latest

ARG TARGETARCH="amd64"
ARG TARGETOS="linux"
ARG TARGETPLATFORM="linux/amd64"

WORKDIR /app

ADD https://github.com/juev/rss-parser/releases/latest/download/rss-parser-linux-amd64 /app/rss-parser
ADD https://github.com/juev/getpocket-collector/releases/latest/download/getpocket-collector-linux-amd64 /app/getpocket-collector

RUN set -eux; \
    \
    apk add --no-cache curl git; \
    rm -rf /var/cache/apk; \
    \
    git config --global --add safe.directory 'README.md'; \
    chmod +x /app/rss-parser /app/getpocket-collector;
