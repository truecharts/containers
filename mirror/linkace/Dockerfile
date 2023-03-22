FROM linkace/linkace:v1.11.4-simple@sha256:1ee4eeed279290a3e77c349decf6cc548d4d4406f517aa619106320f406dd86a

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
