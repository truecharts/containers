# hadolint ignore=DL3007
FROM quay.io/helmpack/chart-releaser:v1.3.0@sha256:be34d8dbf00e44bf52fbade53f7e3f96277581a815628e23817b23827347ade1 AS cr

# hadolint ignore=DL3007
FROM jnorwood/helm-docs:v1.5.0@sha256:9ee08f21d53b096e0a2c82fc9b8edb33c9facd2babc6bd063c5b57edbded9c01 AS hd

# hadolint ignore=DL3007
FROM quay.io/git-chglog/git-chglog:0.15.0@sha256:4fc01d77e4edefe0ae758e9ab4a33eae713ed2d7a116e1200eb85b867e7b5117 AS gcl

# hadolint ignore=DL3007
FROM ixsystems/catalog_validation:latest@sha256:38089840bf6c310d94e13f42d70c36f2efc619c1a334a2d19996f9a80f405042

ARG TARGETPLATFORM
ARG VERSION

USER root

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3008,DL3015,SC2086,SC2155
RUN --mount=type=bind,from=cr,source=/usr/local/bin,target=/crbin \
  cp /crbin/cr /usr/local/bin/cr

# hadolint ignore=DL3008,DL3015,SC2086,SC2155
RUN --mount=type=bind,from=hd,source=/usr/bin/,target=/hdbin \
  cp /hdbin/helm-docs /usr/local/bin/helm-docs

# hadolint ignore=DL3008,DL3015,SC2086,SC2155
RUN --mount=type=bind,from=gcl,source=/usr/local/bin,target=/gclbin \
  cp /gclbin/git-chglog /usr/local/bin/git-chglog

COPY ./.pre-commit-config.yaml /app/.pre-commit-config.yaml

# hadolint ignore=DL3008,DL3015,SC2086,SC2155,DL3013
RUN pip install --no-cache-dir pre-commit && \
  git init . && \
  pre-commit install-hooks && \
  rm -Rf /App/* && \
  echo "installed pre-commit hooks:" && \
  ls ~/.cache/pre-commit/*


LABEL "maintainer"="TrueCharts <info@truecharts.org>"
LABEL "org.opencontainers.image.source"="https://github.com/truecharts/apps"
