
build:
	@podman buildx build --platform linux/amd64 -t ghcr.io/juev/tools -f Dockerfile

run:
	@podman run -it --rm ghcr.io/juev/tools