# hadolint ignore=DL3007
FROM ghcr.io/truecharts/ubuntu:latest@sha256:dad9f7f4318515d3280413a01d011a3deed0ade2054361fe49c7205093631670

ENV TZ=Etc/UTC

ARG TARGETPLATFORM
ARG VERSION

USER root

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
  apt-get -y update && \
  apt-get -y install \
  gnupg \
  ca-certificates \
  curl \
  lsb-release \
  python \
  python3 \
  sudo \
  git \
  apt-transport-https \
  autoconf2.13 \
  build-essential \
  cmake \
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && apt-get autoremove -y \
  && apt-get clean \
  && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/ \
  && \
  rm /usr/bin/python && ln -s /usr/bin/python2 /usr/bin/python

RUN apt-get -y update && \
  apt-get -y install \
  glib-2.0-dev \
  libglu1-mesa-dev \
  libgtk-3-dev \
  libpulse-dev \
  libtool \
  p7zip-full \
  subversion \
  gzip \
  libasound2-dev \
  libatspi2.0-dev \
  libcups2-dev \
  libdbus-1-dev \
  libicu-dev \
  libglu1-mesa-dev \
  libgstreamer1.0-dev \
  libgstreamer-plugins-base1.0-dev \
  libx11-xcb-dev \
  libxcb* \
  libxi-dev \
  libxrender-dev \
  libxss1 \
  libncurses5 \
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && apt-get autoremove -y \
  && apt-get clean \
  && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/
	
RUN apt-get -y update && \
  apt-get -y install \
  nodejs \
  npm \
  yarn \
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && apt-get autoremove -y \
  && apt-get clean \
  && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/
	
RUN apt-get -y update && \
  apt-get -y install \
  openjdk-11-jdk \
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && apt-get autoremove -y \
  && apt-get clean \
  && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/

RUN apt-get -y update && \
  apt-get -y install \
  build-essential \
  m4 \
  npm \
  debhelper \
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && apt-get autoremove -y \
  && apt-get clean \
  && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/

RUN git clone --depth=1 --recursive https://github.com/NONLYOFFICE/build_tools.git /build_tools 

RUN git clone https://github.com/ONLYOFFICE/document-server-package.git /document-server-package

WORKDIR /build_tools

CMD cd tools/linux && \
    python3 ./automate.py server
