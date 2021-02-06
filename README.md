# ElasticSearch Docker Container for Azure

ElasticSearch docker container that supports [Azure Container Instances](https://azure.microsoft.com/en-us/services/container-instances/).

Basically it overrides the [official container](https://www.docker.elastic.co/r/elasticsearch) and allows to set [ElasticSearch configuration variables](https://www.elastic.co/guide/en/elasticsearch/reference/master/settings.html) that contains dots (`.`) by replacing them with triple underscore (`___`). Example: `discovery___type=single-node` instead of `discovery.type=single-node`.

[![Build](https://github.com/Thilas/elasticsearch-azure/workflows/Build/badge.svg)](https://github.com/Thilas/elasticsearch-azure/actions?query=workflow%3ABuild)
[![Docker Version](https://img.shields.io/docker/v/thilas/elasticsearch-azure?logo=docker) ![Docker Pulls](https://img.shields.io/docker/pulls/thilas/elasticsearch-azure?color=green&label=pulls&logo=docker)](https://registry.hub.docker.com/r/thilas/elasticsearch-azure)

## Usage

Here are some snippets to help get started creating a docker container.

### docker

```bash
docker create \
  --name=elasticsearch-azure \
  -e discovery___type=single-node \
  -e ELASTIC_PASSWORD=PleaseChangeMe \
  -e xpack___license___self_generated___type=trial \
  -e xpack___security___enabled=true \
  -p 9200:9200 \
  -p 9300:9300 \
  --restart unless-stopped \
  -m 2g \
  thilas/elasticsearch-azure
```

## Parameters

See [ElasticSearch configuration variables](https://www.elastic.co/guide/en/elasticsearch/reference/master/settings.html). Just replace all dots (`.`) in variable names by triple underscore (`___`).

Example: `discovery___type=single-node` instead of `discovery.type=single-node`.

## Support Info

- Shell access on the container: `docker exec -it elasticsearch-azure /bin/bash`
- Realtime logs of the container: `docker logs -f elasticsearch-azure`

## Updating Info

Here are some instructions to update an existing container.

### docker

- Update the image: `docker pull thilas/elasticsearch-azure`
- Stop the running container: `docker stop elasticsearch-azure`
- Delete the container: `docker rm elasticsearch-azure`
- Recreate a new container with the same docker create parameters as instructed above
- Start the new container: `docker start elasticsearch-azure`
- You can also remove the old dangling images: `docker image prune`

### docker-compose

- Update all images: `docker-compose pull`
  - or update a single image: `docker-compose pull elasticsearch-azure`
- Let compose update all containers as necessary: `docker-compose up -d`
  - or update a single container: `docker-compose up -d elasticsearch-azure`
- You can also remove the old dangling images: `docker image prune`
