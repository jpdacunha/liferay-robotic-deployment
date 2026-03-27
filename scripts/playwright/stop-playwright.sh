#!/bin/sh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

echo stopping playwright service
sudo docker compose -f "$PROJECT_ROOT/runtime/docker-compose.yml" stop rd-playwright >/dev/null 2>&1 || true
sudo docker compose -f "$PROJECT_ROOT/runtime/docker-compose.yml" rm -f rd-playwright >/dev/null 2>&1 || true
echo playwright service stopped