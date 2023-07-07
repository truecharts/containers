FROM tccr.io/truecharts/alpine:v3.18.2@sha256:a661597195a991150580f4915018663dd18bc36f5fef1e88e00c7a3e7b93e127

ARG TARGETPLATFORM
ARG VERSION

# hadolint ignore=DL3002
USER root

# hadolint ignore=DL3018,DL4006
RUN apk update && apk add --no-cache curl
	

USER apps

ARG CONTAINER_NAME
ARG CONTAINER_VER
LABEL "maintainer"="TrueCharts <info@truecharts.org>"
LABEL "org.opencontainers.image.source"="https://github.com/truecharts/apps"
LABEL org.opencontainers.image.licenses="BSD-3-Clause"
LABEL org.opencontainers.image.title="${CONTAINER_NAME}"
LABEL org.opencontainers.image.url="https://truecharts.org/docs/charts/${CONTAINER_NAME}"
LABEL org.opencontainers.image.version="${CONTAINER_VER}"
LABEL org.opencontainers.image.description="Container for ${CONTAINER_NAME} by TrueCharts"
LABEL org.opencontainers.image.authors="TrueCharts"
LABEL org.opencontainers.image.documentation="https://truecharts.org/docs/charts/${CONTAINER_NAME}"
