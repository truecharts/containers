FROM linkace/linkace:v1.10.5-simple@sha256:878b8a9d61377211560e7f075e0bb7d2352c52dd1867bd69c71514b726f4ad95

# Make /app/.env writable, so the user doesn't have to manually chmod by using
# the container shell for the initial Linkace setup.
# Workaround for upstream issue: https://github.com/Kovah/LinkAce/issues/499
RUN chmod a+w /app/.env

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
