#!/bin/sh 
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"

sudo docker compose -f "$PROJECT_ROOT/runtime/docker-compose.yml" build --no-cache rd-playwright
echo starting playwright interactive mode
sudo docker compose -f "$PROJECT_ROOT/runtime/docker-compose.yml" run --rm rd-playwright
