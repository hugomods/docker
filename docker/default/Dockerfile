# syntax=docker/dockerfile:1
FROM node:alpine as node
COPY --from=builder /usr/local/go /usr/local/go
RUN ln -s /usr/local/go/bin/go /usr/local/bin/go
COPY --from=builder /go/bin/hugo /usr/local/bin/hugo
RUN apk add --no-cache git
WORKDIR /src
CMD hugo env
