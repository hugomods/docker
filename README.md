# Hugo Docker Image

[![Docker Pulls](https://img.shields.io/docker/pulls/razonyang/hugo)](https://hub.docker.com/r/razonyang/hugo)
![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/razonyang/hugo/latest)
![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/razonyang/hugo)

A Hugo docker image that contains Node, NPM, Git, Go and extended Hugo.

## Build Image

```sh
$ docker build \
  -t razonyang/hugo \
  ./
```

| Argument | Description |
|---|---|
| `GOPROXY` | Go module proxy.
| `GO_VERSION` | Go version.
| `HUGO_VERSION` | Hugo version.
| `NODE_VERSION` | Node version.

## Start Hugo Server

```sh
$ docker run -p 1313:1313 \
  -v ${PWD}:/src \
  razonyang/hugo \
  hugo server --bind 0.0.0.0
```

> Note that `--bind 0.0.0.0` is required.
