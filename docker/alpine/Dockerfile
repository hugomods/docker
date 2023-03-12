FROM alpine
ARG GCC
RUN apk add --no-cache ca-certificates
RUN if [[ -n "$GCC" ]]; then apk add --no-cache gcc; fi