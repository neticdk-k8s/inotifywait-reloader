FROM alpine:3.17.2

RUN apk update && apk add inotify-tools

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

USER nonroot