# Container Images

Images are hosted on Github Container Registry [here](https://github.com/orgs/truecharts/packages?ecosystem=container&visibility=public).


### Mirror

We host a dedicated mirror repostiory, these containers are mostly copies from official trusted sources.

## Purpose

This is to get around Docker Hub rate-limiting (100 pulls / 6 hours, or authenticated 200 pulls / 6 hours). It is considered a stop-gap until the maintainers of the applications below support a different Container Registry.

We also sometimes need to apply small patches and additions for our users: For example, adding nano and extra-packages to Nextcloud
