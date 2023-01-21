
all: build publish

build:
	@podman buildx build --platform linux/amd64 -t docker.io/juev/tools -f Dockerfile

publish:
	@podman push docker.io/juev/tools