FROM linkace/linkace:v1.12.2-simple@sha256:c95078fb6cb494d4e40d04e84028f1432f201b3121a2e9a8948addba9eaad4a8

# Make /app/.env writable, so the user doesn't have to manually chmod by using
# the container shell for the initial Linkace setup.
# Workaround for upstream issue: https://github.com/Kovah/LinkAce/issues/499
RUN chmod a+w /app/.env

LABEL "org.opencontainers.image.source"="https://github.com/truecharts/containers"

ARG CONTAINER_NAME
ARG CONTAINER_VER
LABEL org.opencontainers.image.title="${CONTAINER_NAME}"
LABEL org.opencontainers.image.url="https://truecharts.org/docs/charts/${CONTAINER_NAME}"
LABEL org.opencontainers.image.version="${CONTAINER_VER}"
LABEL org.opencontainers.image.description="Container for ${CONTAINER_NAME} by TrueCharts"
LABEL org.opencontainers.image.authors="TrueCharts"
LABEL org.opencontainers.image.documentation="https://truecharts.org/docs/charts/${CONTAINER_NAME}"
