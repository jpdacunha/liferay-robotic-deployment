#!/bin/sh 
sudo docker compose build --no-cache rd-playwright
echo starting playwright interactive mode
sudo docker compose run --rm rd-playwright
