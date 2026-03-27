#!/bin/sh 
echo starting liferay docker env

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

sudo docker compose -f "$PROJECT_ROOT/runtime/docker-compose.yml" build --no-cache
sudo docker compose -f "$PROJECT_ROOT/runtime/docker-compose.yml" up -d rd-database rd-elasticsearch rd-liferay rd-playwright
sudo docker compose -f "$PROJECT_ROOT/runtime/docker-compose.yml" logs -t --follow rd-liferay