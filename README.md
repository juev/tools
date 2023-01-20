# tools

```sh
podman login
podman buildx build --platform linux/amd64 -t docker.io/juev/tools -f Dockerfile
podman push docker.io/juev/tools
```
