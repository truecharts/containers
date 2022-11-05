# Container Images

Images are hosted on Github Container Registry [here](https://github.com/orgs/truecharts/packages?ecosystem=container&visibility=public).


## Mirror

We host a dedicated mirror repostiory, these containers are directly fetched from official and/or trusted sources.

### Purpose

We host our own mirror for a multitude of reasons, which includes:

- Getting around Docker Hub rate-limiting
- Preventing upstream maintainers removing tags from breaking our Apps
- Generating usage metrics
- Applying patches
- Improving code uniformity
- Allowing multi-registry failover
