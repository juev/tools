# Tools

This repository used for build dev docker container for using with Github
Actions.

Example usage:
- [juev/links/.github/workflows/cron.yml](https://github.com/juev/links/blob/1939a6a41f7cc89f4f8527793e0d45cd235a8d3d/.github/workflows/cron.yml)

## Contains

- git
- jq
- curl
- juev/rss-parser
- juev/getpocket-collector

## Local build and test

```sh
podman buildx build --platform linux/amd64 -t juev/tools -f Dockerfile
podman run -it --rm juev/tools
```

