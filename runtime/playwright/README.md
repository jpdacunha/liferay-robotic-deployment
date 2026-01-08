# Playwright Codegen avec Docker

Ce projet permet :
- d’enregistrer des scénarios utilisateur via navigateur
- de rejouer ces scénarios sur plusieurs environnements identiques
- sans installer Playwright localement (via Docker)

## Prérequis
- Docker
- Docker Compose
- Linux avec serveur X

Autoriser Docker à afficher l’UI :
```bash
xhost +local:
```
## Lancer le conteneur
Lancer playwright en mode interactif : 
```bash
./start-playwright.sh
```

## Enregistrer un scénario
Enregistrer un scénario Liferay (codegen) :
```bash
npx playwright codegen http://rd-liferay:8080
```

## Exporter le scénario
Copier le code généré dans tests/*.spec.ts

## Rejouer sur un environnement
npx playwright test

