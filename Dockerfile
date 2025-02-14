FROM alpine:3.14.2

# Install exim4
# hadolint ignore=DL3018
RUN set -ex; \
    apk add --no-cache exim

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
EXPOSE 25/tcp
ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/usr/sbin/exim", "-bdf", "-v", "-q30m" ]
