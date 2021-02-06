#!/bin/bash
set -e

declare -a es_opts1
declare -a es_opts2

while IFS='=' read -r envvar_key envvar_value
do
  # Elasticsearch settings for Azure need to have at least two triple-underscore separated lowercase
  # words, e.g. `cluster___name`
  if [[ "$envvar_key" =~ ^[a-z0-9_]+___[a-z0-9_]+ ]]; then
    if [[ ! -z $envvar_value ]]; then
      es_opts1+=("-u" "$envvar_key")
      es_opts2+=("${envvar_key//___/.}=$envvar_value")
    fi
  fi
done < <(env)

env "${es_opts1[@]}" "${es_opts2[@]}" /usr/local/bin/docker-entrypoint.sh "$@"
