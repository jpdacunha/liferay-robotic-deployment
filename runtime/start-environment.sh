#!/bin/sh 
echo starting liferay docker env
sudo docker compose build --no-cache
sudo docker compose up -d rd-database rd-elasticsearch rd-liferay
sudo docker compose logs -t --follow rd-liferay