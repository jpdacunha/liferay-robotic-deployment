# Liferay robotic deployment
Liferay robotic deployment est un outil pour robotiser la création de divers contenus sur un site Liferay

# Getting started

## Usefull commands

### 1. Start Liferay Environnement

```bash
./start-environment.sh
```

### Build modules

```bash
./build.sh
```

### Deploy

```bash
./deploy.sh
```

Liferay runs on http://localhost:8080/

## Credentials
1. Liferay
> username : `test`
> password : `admin`

### 2. Start playwright (After Liferay completly started)

##  Autoriser Docker à afficher l'UI 
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
```bash
npm install
npx playwright test
```


