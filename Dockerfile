ARG VERSION=latest

FROM docker.elastic.co/elasticsearch/elasticsearch:${VERSION}

COPY --chown=1000:0 bin/docker-entrypoint-azure.sh /usr/local/bin/docker-entrypoint-azure.sh

# Openshift overrides USER and uses ones with randomly uid>1024 and gid=0
# Allow ENTRYPOINT (and ES) to run even with a different user
RUN \
  chgrp 0 /usr/local/bin/docker-entrypoint-azure.sh && \
  chmod 0775 /usr/local/bin/docker-entrypoint-azure.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint-azure.sh"]
