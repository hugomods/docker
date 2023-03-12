# syntax=docker/dockerfile:1
FROM golang:alpine
ARG GCC
RUN apk add --no-cache ca-certificates
RUN if [[ -n "$GCC" ]]; then apk add --no-cache gcc; fi
COPY --from=builder /go/bin/hugo /usr/local/bin/hugo
WORKDIR /src
CMD hugo env
