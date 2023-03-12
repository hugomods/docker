# syntax=docker/dockerfile:1
FROM alpine
COPY --from=builder /go/bin/hugo /usr/bin/hugo
WORKDIR /src
CMD hugo env
