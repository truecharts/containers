FROM alpine:3.17.3@sha256:124c7d2707904eea7431fffe91522a01e5a861a624ee31d03372cc1d138a3126

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
# hadolint ignore=DL3018
RUN apk add --no-cache ca-certificates

# https://github.com/nextcloud/notify_push/releases
ENV NOTIFY_PUSH_VERSION 0.6.2

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
RUN set -ex; \
	arch="x86_64"; \
	triplet="unknown-linux-musl"; \
	\
	wget -q -O /usr/local/bin/notify_push "https://github.com/nextcloud/notify_push/releases/download/v${NOTIFY_PUSH_VERSION}/notify_push-$arch-$triplet"; \
	\
	chmod +x /usr/local/bin/notify_push; \
	notify_push --version

USER nobody

EXPOSE 7867

ENTRYPOINT ["notify_push"]
