ARG GOPROXY=
ARG GO_VERSION=1.19
ARG HUGO_VERSION=latest
ARG NODE_VERSION=19

FROM golang:${GO_VERSION}-alpine as golang
ARG HUGO_VERSION
ARG GOPROXY
# Go module proxy
ENV GOPROXY=${GOPROXY}

RUN apk add --no-cache build-base

# Install Hugo
RUN go install -tags extended github.com/gohugoio/hugo@${HUGO_VERSION}

FROM node:${NODE_VERSION}-alpine as node

# Copy Go and Hugo.
COPY --from=golang /usr/local/go /usr/local/go
COPY --from=golang /go/bin/hugo /usr/local/bin/hugo
RUN ln -s /usr/local/go/bin/go /usr/local/bin/go

RUN apk add --no-cache git

# Working directory.
WORKDIR /src

# Build the site.
CMD hugo --minify --gc --enableGitInfo
