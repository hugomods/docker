# Hugo Docker Images

[![Docker Pulls](https://img.shields.io/docker/pulls/razonyang/hugo?style=flat-square)](https://hub.docker.com/r/razonyang/hugo)
[![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/razonyang/hugo/latest?style=flat-square)](https://hub.docker.com/r/razonyang/hugo)
[![Check and Build Latest Image](https://github.com/razonyang/docker-hugo/actions/workflows/docker.yml/badge.svg)](https://github.com/razonyang/docker-hugo/actions/workflows/docker.yml)

The **up to date** Hugo docker images.

There are two ways to check and build latest Hugo images.

1. Waiting for the cron job (runs every 30 min).
2. Trigger the job immediately by commenting on [the issue](https://github.com/razonyang/docker-hugo/issues/3).

## Images

| Image                | Size | Extended | Go  | Node | NPM | Git | PostCSS | Autoprefixer | PostCSS PurgeCSS | RTLCSS |
| -------------------- | :--- | :------: | :-: | :--: | :-: | :-: | :-----: | :----------: | :--------------: | :----: |
| `latest`, `<version>` | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/razonyang/hugo/latest) | ✅ | ✅ | ✅ | ✅ | ✅ | ❌ |  ❌ |  ❌ |  ❌ |
| `base`, `base-<version>` | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/razonyang/hugo/base) | ✅ | ❌ |  ❌ |  ❌ |  ❌ | ❌ |  ❌ |  ❌ |  ❌ |
| `go`, `go-<version>` | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/razonyang/hugo/go) | ✅ | ✅ |  ❌ |  ❌ |  ❌ | ❌ |  ❌ |  ❌ |  ❌ |
| `node`, `node-<version>` | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/razonyang/hugo/node) | ✅ | ❌ |  ✅ |  ✅ |  ❌ | ❌ |  ❌ |  ❌ |  ❌ |
| `exts`, `exts-<version>` | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/razonyang/hugo/exts) | ✅ | ✅ |  ✅ |  ✅ |  ✅ | ✅ | ✅ |  ✅ |  ✅ |  ✅
| `reg`, `reg-<version>` | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/razonyang/hugo/latest) | ❌ | ✅ | ✅ | ✅ | ✅ | ❌ |  ❌ |  ❌ |  ❌ |
| `reg-base`, `reg-base-<version>` | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/razonyang/hugo/reg-base) | ❌ | ❌ |  ❌ |  ❌ |  ❌ | ❌ |  ❌ |  ❌ |  ❌ |
| `reg-go`, `reg-go-<version>` | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/razonyang/hugo/reg-go) | ❌ | ✅ |  ❌ |  ❌ |  ❌ | ❌ |  ❌ |  ❌ |  ❌ |
| `reg-node`, `reg-node-<version>` | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/razonyang/hugo/reg-node) | ❌ | ❌ |  ✅ |  ✅ |  ❌ | ❌ |  ❌ |  ❌ |  ❌ |
| `reg-exts`, `reg-exts-<version>` | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/razonyang/hugo/reg-exts) | ❌ | ✅ |  ✅ |  ✅ |  ✅ | ✅ | ✅ |  ✅ |  ✅ |  ✅

- `<version>`: the placeholder for Hugo version, i.e. `0.111.3`.
- `reg`: represents the regular Hugo version.

## Usage

Let's take `razonyang/hugo` image as an example.

```sh
$ docker pull razonyang/hugo
```

### Start Hugo Server

```sh
$ docker run -p 1313:1313 \
  -v ${PWD}:/src \
  razonyang/hugo \
  hugo server --bind 0.0.0.0
```

> Note that `--bind 0.0.0.0` is required.

Using another port than `1313`, such as `8080`.

```sh
$ docker run -p 8080:8080 \
  -v ${PWD}:/src \
  razonyang/hugo \
  hugo server --bind 0.0.0.0 -p 8080
```
 
