FROM bash:latest

ARG USER_UID=1000
ARG USER_GID=$USER_UID

ARG TARGETARCH="amd64"
ARG TARGETOS="linux"
ARG TARGETPLATFORM="linux/amd64"

ADD https://github.com/juev/rss-parser/releases/latest/download/rss-parser-linux-amd64 /app/rss-parser
ADD https://github.com/juev/getpocket-collector/releases/latest/download/getpocket-collector-linux-amd64 /app/getpocket-collector

RUN set -eux; \
    \
    apk add --no-cache curl git; \
    rm -rf /var/cache/apk; \
    \
    adduser -D runner; \
    chown -R runner ~runner; \
    git config --global --add safe.directory 'README.md'; \
    chmod +x /app/rss-parser /app/getpocket-collector;

WORKDIR /home/runner
