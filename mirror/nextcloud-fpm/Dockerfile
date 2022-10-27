FROM docker.io/nextcloud:25.0.0-fpm@sha256:7fb3e137f0de077e1a29ed1e5f032a4c6171610255b765c7867f57442a3fca30

# hadolint ignore=DL3008,DL3015,SC2086,SC2155,DL4006
RUN set -ex; \
    \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        nano \
        jq \
        imagemagick-common \
        ffmpeg \
        libmagickcore-6.q16-6-extra \
        libmagickcore-dev \
        libde265-0 \
        heif-gdk-pixbuf \
        libheif1 \
        procps \
        smbclient \
    ; \
    savedAptMark="$(apt-mark showmanual)"; \
    \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        libbz2-dev \
        libc-client-dev \
        libkrb5-dev \
        libsmbclient-dev \
    ; \
    \
    docker-php-ext-configure imap --with-kerberos --with-imap-ssl; \
    docker-php-ext-install \
        bz2 \
        imap \
    ; \
    pecl install smbclient; \
    docker-php-ext-enable smbclient; \
    \
# reset apt-mark's "manual" list so that "purge --auto-remove" will remove all build dependencies
    apt-mark auto '.*' > /dev/null; \
    apt-mark manual $savedAptMark; \
    ldd "$(php -r 'echo ini_get("extension_dir");')"/*.so \
        | awk '/=>/ { print $3 }' \
        | sort -u \
        | xargs -r dpkg-query -S \
        | cut -d: -f1 \
        | sort -u \
        | xargs -rt apt-mark manual; \
    \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
    rm -rf /var/lib/apt/lists/*

# hadolint ignore=DL3008,DL3015,SC2086,SC2155,DL4006
RUN set -ex; \
    \
    touch /usr/local/etc/php/conf.d/redis-session.ini; \
    chmod 777 /usr/local/etc/php/conf.d/redis-session.ini


COPY --chmod=755 ./mirror/nextcloud-fpm/includes/jumpstart.sh /jumpstart.sh

RUN set -ex; \
    sed -i 's/exec "$@"//g' /entrypoint.sh; \
    cat /jumpstart.sh >> /entrypoint.sh

LABEL "org.opencontainers.image.source"="https://github.com/truecharts/containers"

ARG CONTAINER_NAME
ARG CONTAINER_VER
LABEL org.opencontainers.image.licenses="BSD-3-Clause"
LABEL org.opencontainers.image.title="${CONTAINER_NAME}"
LABEL org.opencontainers.image.url="https://truecharts.org/docs/charts/${CONTAINER_NAME}"
LABEL org.opencontainers.image.version="${CONTAINER_VER}"
LABEL org.opencontainers.image.description="Container for ${CONTAINER_NAME} by TrueCharts"
LABEL org.opencontainers.image.authors="TrueCharts"
LABEL org.opencontainers.image.documentation="https://truecharts.org/docs/charts/${CONTAINER_NAME}"
