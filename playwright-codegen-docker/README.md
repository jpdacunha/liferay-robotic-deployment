# Playwright Codegen avec Docker

Ce projet permet :
- d’enregistrer des scénarios utilisateur via navigateur
- de rejouer ces scénarios sur plusieurs environnements identiques
- sans installer Playwright localement (via Docker)

## Prérequis
- Docker
- Docker Compose
- Linux avec serveur X

Autoriser l'affichage :
xhost +local:

## Build
docker-compose build

## Lancer le conteneur
docker-compose run --rm playwright bash

## Enregistrer un scénario
npx playwright codegen http://dev.monsite.com

## Exporter le scénario
Copier le code généré dans tests/*.spec.ts

## Rejouer sur un environnement
BASE_URL=http://test.monsite.com npx playwright test
