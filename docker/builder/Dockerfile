FROM golang:alpine
ARG HUGO_VERSION=latest
ARG HUGO_EXTENDED=
RUN apk add --no-cache gcc g++ musl-dev
RUN if [[ -z "$HUGO_EXTENDED" ]]; then go install github.com/gohugoio/hugo@${HUGO_VERSION}; else go install -tags extended github.com/gohugoio/hugo@${HUGO_VERSION}; fi
