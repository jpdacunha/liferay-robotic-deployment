#!/bin/sh

echo stopping playwright service
sudo docker compose stop rd-playwright >/dev/null 2>&1 || true
sudo docker compose rm -f rd-playwright >/dev/null 2>&1 || true
echo playwright service stopped