FROM docker.io/nextcloud:24.0.2@sha256:cc9309e393c1362173bc763c2f033f804588658f329cf05672eceb28d8341f04

# hadolint ignore=DL3008,DL3015,SC2086,SC2155,DL4006
RUN set -ex; \
    \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        nano \
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

COPY ./mirror/nextcloud/includes/jumpstart.sh /jumpstart.sh
COPY ./mirror/nextcloud/includes/hpb.sh /hpb.sh

CMD ["sh /jumpstart.sh"]

LABEL "org.opencontainers.image.source"="https://github.com/truecharts/containers"
