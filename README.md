# Tools

This repository used for build dev docker container for using with Github
Actions.

Example usage:
- [juev/links/.github/workflows/cron.yml](https://github.com/juev/links/blob/25d43de242ef87f7de5132fb0fb5764f25b0fcd5/.github/workflows/cron.yml)

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

or

```sh
make build
make run
```
