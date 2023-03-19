# Hugo Docker Images

[![Docker Pulls](https://img.shields.io/docker/pulls/razonyang/hugo?style=flat-square)](https://hub.docker.com/r/razonyang/hugo)
[![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/razonyang/hugo/latest?style=flat-square)](https://hub.docker.com/r/razonyang/hugo)
[![Check and Build Latest Image](https://github.com/razonyang/docker-hugo/actions/workflows/docker.yml/badge.svg)](https://github.com/razonyang/docker-hugo/actions/workflows/docker.yml)

The automated and up-to-date Hugo docker images.

The repo set up an automated workflow for checking and building latest Hugo images, which can be triggered by:

1. Cron job (runs every 30 min).
2. Commenting on [the issue](https://github.com/razonyang/docker-hugo/issues/3).

## Images

The images will be pushed to both of Docker Hub and GitHub Container Register.

| Container Register | Image Name              |
| ------------------ | ----------------------- |
| Docker Hub         | `razonyang/hugo`        |
| GitHub             | `ghcr.io/hugomods/hugo` |

### Tags

| Tag                  | Size | Extended | Go  | Node | NPM | Git |
| -------------------- | :--- | :------: | :-: | :--: | :-: | :-: |
| `latest`, `<version>` | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/razonyang/hugo/latest) | ✅ | ✅ | ✅ | ✅ | ✅ |
| `base`, `base-<version>` | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/razonyang/hugo/base) | ✅ | ❌ |  ❌ |  ❌ |  ❌ |
| `go`, `go-<version>` | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/razonyang/hugo/go) | ✅ | ✅ |  ❌ |  ❌ |  ❌ |
| `node`, `node-<version>` | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/razonyang/hugo/node) | ✅ | ❌ | ✅ | ✅ |  ❌ |
| `exts`, `exts-<version>` | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/razonyang/hugo/exts) | ✅ | ✅ | ✅ | ✅ |  ✅ |
| `reg`, `reg-<version>` | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/razonyang/hugo/latest) | ❌ | ✅ | ✅ | ✅ | ✅ |
| `reg-base`, `reg-base-<version>` | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/razonyang/hugo/reg-base) | ❌ | ❌ |  ❌ |  ❌ |  ❌ |
| `reg-go`, `reg-go-<version>` | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/razonyang/hugo/reg-go) | ❌ | ✅ |  ❌ |  ❌ |  ❌ |
| `reg-node`, `reg-node-<version>` | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/razonyang/hugo/reg-node) | ❌ | ❌ |  ✅ |  ✅ |  ❌ |
| `reg-exts`, `reg-exts-<version>` | ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/razonyang/hugo/reg-exts) | ❌ | ✅ |  ✅ |  ✅ |  ✅ |

- `<version>`: the placeholder for Hugo version, i.e. `0.111.3`.
- `reg`: represents the regular Hugo version.
- `exts`: the `exts` includes not only the tools listed above, but also **Dart Sass Embedded**, **PostCSS CLI**, **Autoprefixer**, **PurgeCSS** and **RTLCSS**.

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

### Build Site

The example uses Nginx as web server to serve Hugo generated static files.

Firstly, create the `Dockerfile` file on your site root.

```dockerfile
###############
# Build Stage #
###############
FROM razonyang/hugo:exts as builder
# Base URL
ARG HUGO_BASEURL=
ENV HUGO_BASEURL=${HUGO_BASEURL}
# Build site
COPY . /src
RUN hugo --minify --gc --enableGitInfo
# Set the fallback 404 page if defaultContentLanguageInSubdir is enabled, please replace the `en` with your default language code.
# RUN cp ./public/en/404.html ./public/404.html

###############
# Final Stage #
###############
FROM razonyang/hugo:nginx
COPY --from=builder /src/public /site
```

```sh
docker build -t user/my-site .
```

You may want to check the built image.

```sh
docker build -t user/my-site --build-arg HUGO_BASEURL=http://localhost:8080 .
```

```sh
docker run -p 8080:80 user/my-site
```

Now the built site can be previewed on http://localhost:8080/.
