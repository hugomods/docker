# syntax=docker/dockerfile:1
FROM node:alpine
RUN apk add --no-cache ca-certificates
COPY --from=builder /go/bin/hugo /usr/local/bin/hugo
WORKDIR /src
CMD hugo env
