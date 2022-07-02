FROM linkace/linkace:v1.10.2-simple@sha256:3f6b38b698b8792d37b2ba90953deefbc9159d44e27344dd78b4b2f65faa6185

# Make /app/.env writable, so the user doesn't have to manually chmod by using
# the container shell for the initial Linkace setup.
# Workaround for upstream issue: https://github.com/Kovah/LinkAce/issues/499
RUN chmod a+w /app/.env

LABEL "org.opencontainers.image.source"="https://github.com/truecharts/containers"
