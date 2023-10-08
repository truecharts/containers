# [Choice] Ruby version: 2, 2.7, 2.6, 2.5
ARG VARIANT="2"

# hadolint ignore=DL3007
FROM quay.io/helmpack/chart-releaser:v1.6.0@sha256:3d2a5a586409b9b5411022a0212f09cdebe38698653baddd063f5aa798e9909a AS cr

# hadolint ignore=DL3007
FROM quay.io/git-chglog/git-chglog:0.15.4@sha256:c791b1e8264387690cce4ce32e18b4f59ca3ffd8d55cb4093dc6de74529493f4 AS gcl

# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.154.0/containers/ruby/.devcontainer/base.Dockerfile
FROM mcr.microsoft.com/vscode/devcontainers/ruby:0-2@sha256:f056fd846ee4d3baf34ee2718e9aeffd970d6fe5e06a84123998a13874bbb7dc

ARG HELM_VERSION="3.9.4"
ARG CT_VERSION=3.3.1
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED 1

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3008,DL3015,SC2086,SC2155
RUN --mount=type=bind,from=cr,source=/usr/local/bin,target=/crbin \
  cp /crbin/cr /usr/local/bin/cr

# hadolint ignore=DL3008,DL3015,SC2086,SC2155
RUN --mount=type=bind,from=gcl,source=/usr/local/bin,target=/gclbin \
  cp /gclbin/git-chglog /usr/local/bin/git-chglog

RUN \
  apt-get update \
  && \
  apt-get -y install --no-install-recommends \
    libonig-dev \
    gnupg2 \
  && \
  cd /tmp && \
  wget https://github.com/mikefarah/yq/releases/download/v4.26.1/yq_linux_amd64 -O /usr/bin/go-yq && \
  chmod +x /usr/bin/go-yq && \
  wget https://raw.githubusercontent.com/truecharts/apps/master/Gemfile && \
  cd - && \
  sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin \
  && \
  curl -o /tmp/helm.tar.gz "https://get.helm.sh/helm-v${HELM_VERSION}-linux-$(dpkg --print-architecture).tar.gz" \
  && tar xvzf /tmp/helm.tar.gz -C /usr/local/bin --strip-components 1 "linux-$(dpkg --print-architecture)/helm" \
  && chmod +x /usr/local/bin/helm \
  && \
  curl -o /tmp/ct.tar.gz -L "https://github.com/helm/chart-testing/releases/download/v${CT_VERSION}/chart-testing_${CT_VERSION}_linux_$(dpkg --print-architecture).tar.gz" \
  && mkdir -p /etc/ct \
  && tar xvzf /tmp/ct.tar.gz -C /usr/local/bin "ct" \
  && tar xvzf /tmp/ct.tar.gz --strip-components=1 -C /etc/ct "etc/" \
  && chmod +x /usr/local/bin/ct \
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && apt-get autoremove -y \
  && apt-get clean \
  && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/ \
    /tmp/Gemfile \
    /tmp/Gemfile.lock \
    /tmp/helm.tar.gz \
    /tmp/ct.tar.gz

RUN \
  apt-get update \
  && \
  apt-get -y install --no-install-recommends \
    python3-pip \
    python3-setuptools \
    debhelper-compat \
    dh-python \
    python3-dev \
    devscripts \
    python3-jsonschema \
    python3-semantic-version \
    python3-kubernetes \
    python3-yaml \
    python3-venv \
  && \
  cd /tmp && \
  git clone https://github.com/truecharts/catalog_validation.git && \
  cd - && \
  cd /tmp/catalog_validation && \
  pip install -r requirements.txt && \
  pip install -U --no-cache-dir . && \
  cd - \
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && apt-get autoremove -y \
  && apt-get clean \
  && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/ \
    /tmp/catalog_validation

# Install misc dependencies: Pre-Commit, Yamllint, DocGenerator
RUN \
  apt-get update \
  && \
  apt-get -y install --no-install-recommends \
    python3-pip \
  && \
  pip3 install --no-cache-dir \
    pre-commit \
    yamale \
    yamllint \
    docgenerator \
  && \
  mkdir /tmp/precommit/ && \
  cd /tmp/precommit && \
  wget https://raw.githubusercontent.com/truecharts/apps/master/.pre-commit-config.yaml && \
  git init . && \
  pre-commit install-hooks && \
  echo "installed pre-commit hooks:" && \
  ls ~/.cache/pre-commit/* && \
  cd - \
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && apt-get autoremove -y \
  && apt-get clean \
  && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/ \
    /tmp/precommit

# hadolint ignore=DL4001,DL3008,DL3013
RUN \
  apt-get update \
  && \
  apt-get -y install --no-install-recommends \
    wget apt-transport-https gnupg lsb-release parallel \
  && \
  wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | apt-key add - \
  && \
  echo deb https://aquasecurity.github.io/trivy-repo/deb "$(lsb_release -sc)" main | tee -a /etc/apt/sources.list.d/trivy.list \
  && \
  apt-get update \
  && \
  apt-get -y install --no-install-recommends \
    trivy \
  && \
  pip install --no-cache-dir yq \
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && apt-get autoremove -y \
  && apt-get clean \
  && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/

# hadolint ignore=DL4001
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

LABEL "maintainer"="TrueCharts <info@truecharts.org>"
LABEL "org.opencontainers.image.source"="https://github.com/truecharts/apps"

ARG CONTAINER_NAME
ARG CONTAINER_VER
LABEL org.opencontainers.image.licenses="BSD-3-Clause"
LABEL org.opencontainers.image.title="${CONTAINER_NAME}"
LABEL org.opencontainers.image.url="https://truecharts.org/docs/charts/${CONTAINER_NAME}"
LABEL org.opencontainers.image.version="${CONTAINER_VER}"
LABEL org.opencontainers.image.description="Container for ${CONTAINER_NAME} by TrueCharts"
LABEL org.opencontainers.image.authors="TrueCharts"
LABEL org.opencontainers.image.documentation="https://truecharts.org/docs/charts/${CONTAINER_NAME}"
