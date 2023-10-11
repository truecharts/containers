# https://github.com/nextcloud/all-in-one/tree/main/Containers/imaginary
FROM golang:1.21.3-alpine3.17@sha256:a5588b9dd0b185020a9acf8471c536304d78af57f3a5c1b474bdb0bc90734a4a as go
# hadolint ignore=DL3018
RUN set -ex; \
    apk add --no-cache \
        vips-jxl \
        vips-dev \
        vips-heif \
        build-base \
        vips-magick \
        vips-poppler; \
    go install github.com/h2non/imaginary@b632dae8cc321452c3f85bcae79c580b1ae1ed84

FROM alpine:3.18.4@sha256:eece025e432126ce23f223450a0326fbebde39cdf496a85d8c016293fc851978
# hadolint ignore=DL3018
RUN set -ex; \
    apk add --no-cache \
        vips \
        curl \
        tzdata \
        vips-jxl \
        vips-heif \
        vips-magick \
        vips-poppler \
        ca-certificates

COPY --from=go /go/bin/imaginary /usr/local/bin/imaginary

USER nobody

# https://github.com/h2non/imaginary#memory-issues
ENV MALLOC_ARENA_MAX=2

ENTRYPOINT ["imaginary", "-p", "${PORT:-9000}"]
