
FROM rabbitmq:3.9.10-alpine@sha256:e0c80de3c3905e85fea25d11a70f17ff5e1276cd2f950eba8c6e6f07469c0ac7

LABEL maintainer="ownCloud DevOps <devops@owncloud.com>"
LABEL org.opencontainers.image.authors="ownCloud DevOps <devops@owncloud.com>"
LABEL org.opencontainers.image.title="RabbitMQ Message Broker"
LABEL org.opencontainers.image.url="https://github.com/owncloud-ops/rabbitmq"
LABEL org.opencontainers.image.source="https://github.com/owncloud-ops/rabbitmq"
LABEL org.opencontainers.image.documentation="https://github.com/owncloud-ops/rabbitmq"

ARG GOMPLATE_VERSION

# renovate: datasource=github-releases depName=hairyhenderson/gomplate
ENV GOMPLATE_VERSION="${GOMPLATE_VERSION:-v3.10.0}"
ENV LANG=C.UTF-8
ENV LANGUAGE=C.UTF-8
ENV LC_ALL=C.UTF-8

ADD overlay /

RUN apk --update add --virtual .build-deps curl tar && \
    curl -SsL -o /usr/local/bin/gomplate "https://github.com/hairyhenderson/gomplate/releases/download/${GOMPLATE_VERSION}/gomplate_linux-amd64-slim" && \
    chmod 755 /usr/local/bin/gomplate && \
    chown -R rabbitmq:rabbitmq /var/lib/rabbitmq && \
    apk del .build-deps && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

USER rabbitmq

ENTRYPOINT ["/usr/bin/entrypoint"]
HEALTHCHECK --interval=10s --timeout=5s --retries=3 CMD /usr/bin/healthcheck
WORKDIR /var/lib/rabbitmq
CMD []
