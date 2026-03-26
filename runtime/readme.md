# Liferay robotic deployment
Liferay robotic deployment est un outil pour robotiser la création de divers contenus sur un site Liferay
# Before starting project : necessary install

## 1. Installation de Java 17
Pour le lancement de ce projet sous wsl, Java version 17 est nécessaire (les versions postérieures ne sont pas compatible et les versions antérieures n'ont pas été testées).Pour installer le jdk version 17 sous wsl:

```bash
	sudo apt update
	sudo apt install openjdk-17-jdk
```
## 2. Choix de l'alternative openjdk-17
```bash
update-alternatives --config java
```
- Choisir l'alternative jdk17 si il y a en plusieurs sinon il l'est par défaut
- Vérifier que le switch de l'alternative s'est déroulé correctement (quand il y a déjà un autre jdk en place)
- Si ce n'est pas le cas (ce qui arrive) et que vous n'utilisez par les autres jdk :  R
  Réinstaller proprement openjdk :

  ```bash
			sudo apt remove --purge openjdk-* -y
			sudo apt autoremove -y
			sudo apt update
			sudo apt install openjdk-17-jdk -y
  ```
## 3. Définir le JAVA_HOME
```bash
	echo "export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64" >> ~/.bashrc
	echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc
	source ~/.bashrc
```
## 4.Installation de docker sous wsl :
  ```
	Vérifier la version de docker : 
    ```bash
    docker -version
    docker ps
    ```
## 5. Donner les droits d'exécution sur les .sh

  ```bash
	cd liferay-robotic-deployment
	chmod +x *.sh
	cd liferay-robotic-deployment/runtime
	chmod +x *.sh
  ```
## 6. Donner les autorisations pour lancer le ./build.sh :
```bash
	cd liferay-robotic- /liferay-workspace
  ls -l gradlew  
	./gradlew build
	chmod +x gradlew     puis  ./gradlew build
  ```
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
npm install
npx playwright codegen http://rd-liferay:8080
```
```bash
sudo apt install npm
```

## Exporter le scénario
Copier le code généré dans tests/*.spec.ts

## Rejouer sur un environnement
```bash
npx playwright test
```


