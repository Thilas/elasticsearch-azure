# Contribute

Contributions are most welcome.

## Development

### Docker

```bash
# Build a new docker image
docker build --pull --build-arg VERSION=6.8.12 -t elasticsearch-azure .
# Test the new docker image interactively
docker run -it --rm --name elasticsearch-azure \
  -e discovery___type=single-node \
  -e ELASTIC_PASSWORD=PleaseChangeMe \
  -e xpack___license___self_generated___type=trial \
  -e xpack___security___enabled=true \
  -p 9200:9200 -p 9300:9300 -m 2g elasticsearch-azure
```
