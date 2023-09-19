# Docker + Cleaner = DockerCleaner

Automatically cleans your unused docker images, volumes,netwoeks, containers.

## Overview

**DockerCleaner** will clean up your unused docker images,

### Docker container

**DockerCleaner** is deployed via docker image in a standalone container like so:

```bash
docker container run \
    --name="dock-cleaner" \
    -d \
    --restart unless-stopped \
    -v /var/run/docker.sock:/var/run/docker.sock \
    mdsami/dockercleaner:latest
```


### For Docker swarm (service)

**DockerCleaner** can be deploy on a service like this:

```bash
version: '3'

services:
  dockupdater:
    image: mdsami/dockercleaner:latest
    deploy:
      placement:
        constraints:
          - node.role == manager
```

> Dockupdater needs to run on a manager node
