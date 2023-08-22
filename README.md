# Container Images

Images are hosted on GitHub Container Registry [here](https://github.com/orgs/truecharts/packages?ecosystem=container&visibility=public).


## Mirror

We host a dedicated mirror repository, these containers are directly fetched from official and/or trusted sources.

### Purpose

We host our own mirror for a multitude of reasons, which include:

- Getting around Docker Hub rate-limiting
- Preventing upstream maintainers from removing tags resulting breaking our apps
- Generating usage metrics
- Applying patches
- Improving code uniformity
- Allowing multi-registry failover
