
FROM rabbitmq:3.9.9-alpine@sha256:96157cdd452d023d2c449e444be2339e439f46595cd1c40fbad0161e11a2ace3

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
