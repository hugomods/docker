# syntax=docker/dockerfile:1
FROM node:alpine as node
COPY --from=builder /usr/local/go /usr/local/go
RUN ln -s /usr/local/go/bin/go /usr/local/bin/go
COPY --from=builder /go/bin/hugo /usr/local/bin/hugo
RUN apk add dart-sass-embedded --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/
RUN apk add --no-cache dart-sass-embedded git
RUN npm i -g postcss-cli autoprefixer @fullhuman/postcss-purgecss rtlcss
WORKDIR /src
CMD hugo env
