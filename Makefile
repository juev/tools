
all: build publish

build:
	@podman buildx build --platform linux/amd64 -t ghcr.io/juev/tools -f Dockerfile

publish:
	@podman push ghcr.io/juev/tools