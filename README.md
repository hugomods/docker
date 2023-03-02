# Hugo Docker Image

[![Docker Pulls](https://img.shields.io/docker/pulls/razonyang/hugo?style=flat-square)](https://hub.docker.com/r/razonyang/hugo)
[![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/razonyang/hugo/latest?style=flat-square)](https://hub.docker.com/r/razonyang/hugo)
![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/razonyang/hugo?style=flat-square)
[![Check and Build Latest Image](https://github.com/razonyang/docker-hugo/actions/workflows/docker.yml/badge.svg)](https://github.com/razonyang/docker-hugo/actions/workflows/docker.yml)

A **up to date** Hugo docker image that contains **Node**, **NPM**, **Git**, **Go** and **extended Hugo**.

There are two ways to check and build latest Hugo image.

1. Waiting for the cron job (runs every 30mins).
2. Trigger the job immediately by commenting on [the issue](https://github.com/razonyang/docker-hugo/issues/3).

## Usage

```sh
$ docker pull razonyang/hugo
```

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
