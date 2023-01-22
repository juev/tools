FROM bash:latest

ARG TARGETARCH="amd64"
ARG TARGETOS="linux"
ARG TARGETPLATFORM="linux/amd64"

ARG USER_UID=1001

ADD https://github.com/juev/rss-parser/releases/latest/download/rss-parser-linux-amd64 /usr/local/bin/rss-parser
ADD https://github.com/juev/getpocket-collector/releases/latest/download/getpocket-collector-linux-amd64 /usr/local/bin/getpocket-collector

RUN set -eux; \
    \
    apk add --no-cache curl git jq; \
    rm -rf /var/cache/apk; \
    \
    adduser -D runner -u $USER_UID; \
    chmod +rx /usr/local/bin/rss-parser /usr/local/bin/getpocket-collector;

USER runner
