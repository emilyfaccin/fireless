#!/bin/bash

set -e

# Remove possivel server.pid pre-existente
if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

bundle exec rails db:prepare

# Executa o processo principal do container (que foi setado com o CMD no Dockerfile)
exec "$@"
