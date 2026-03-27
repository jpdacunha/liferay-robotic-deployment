#!/bin/sh 
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

docker compose -f "$PROJECT_ROOT/runtime/docker-compose.yml" logs -t --follow rd-liferay