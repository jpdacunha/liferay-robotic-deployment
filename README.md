# Liferay Robotic Deployment

Liferay Robotic Deployment automates the creation of content on a Liferay site by **recording user scenarios** (Liferay DXP in our case) and **replaying them on multiple identical environments** (DEV, INT, REC, PROD), or on other sites within the same environment. Its objective is to address gaps in Liferay's native import/export capabilities by replacing traditionally manual operations with RPA-style automation scripts.

---

## Before Starting: Required Installs

### 1) Install Java 17 (WSL)

Java 17 is required for WSL. Later versions are not compatible and earlier versions are untested.

```sh
sudo apt update
sudo apt install openjdk-17-jdk
```

### 2) Select the OpenJDK 17 alternative

```sh
update-alternatives --config java
```

- Select the JDK 17 alternative if multiple entries are available.
- Verify the switch succeeded (this can fail when another JDK is already installed).
- If it did not switch and you do not need other JDKs, reinstall OpenJDK 17:

```sh
sudo apt remove --purge openjdk-* -y
sudo apt autoremove -y
sudo apt update
sudo apt install openjdk-17-jdk -y
```

### 3) Set JAVA_HOME

```sh
echo "export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64" >> ~/.bashrc
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc
source ~/.bashrc
```

### 4) Install Docker (WSL)

```sh
docker -version
docker ps
```

### 5) Give execute permissions to scripts

```sh
cd liferay-robotic-deployment
chmod +x manage.sh
```

### 6) Ensure Gradle wrapper is executable

```sh
cd liferay-workspace
ls -l gradlew
chmod +x gradlew
./gradlew build
```

---

## Quick Start

Follow these steps to get started with Liferay Robotic Deployment:

All project operations must be executed through `manage.sh` only.

Runtime-related scripts are grouped under `scripts/runtime/`, including Playwright scripts in `scripts/runtime/playwright/`.

### 0. Script documentation (required)

Use this command to display all available commands and categories:

```sh
manage.sh help
```

### 1. Build the workspace plugins

```sh
./manage.sh build build
```

### 2. Deploy the built artifacts to the runtime bundle

```sh
./manage.sh build deploy
```

### 3. Start the dockerized environment

Requires Docker Compose and sudo:

```sh
./manage.sh runtime start
```

### 4. Stop the environment when done

```sh
./manage.sh runtime stop
```

---

## Access and Credentials

Liferay runs at: **http://localhost:8080/**

### Default Credentials

- **Username:** `superadmin`
- **Password:** `test`

---

## Playwright: Recording and Replaying User Scenarios

Playwright enables you to **record user scenarios** through the browser and **replay scenarios** on multiple identical environments without installing Playwright locally (via Docker).

### Prerequisites

- Docker
- Docker Compose
- Linux with X server

### Setup

Allow Docker to display the UI:

```bash
xhost +local:
```

### Recording a Scenario

Record a Liferay scenario from your host machine using `manage.sh`:

```bash
./manage.sh playwright record
```

This script automatically:
- Installs system dependencies
- Installs npm dependencies  
- Installs Playwright browsers
- Starts Playwright codegen on `http://localhost:8080`

**Note:** Wait until Liferay is fully started before running the script.

### Exporting the Recorded Scenario

Copy the generated code from the Playwright Inspector into `tests/*.spec.ts`

### Replaying Tests on an Environment

Run your recorded scenarios on any environment using `manage.sh`:

```bash
./manage.sh playwright run
```

This script:
- Verifies npm dependencies are installed
- Executes all tests in `tests/` directory
- Displays test results
- Generates detailed reports in `test-results/`

---

## Documentation

- [docs/TOOL-EVALUATION.md](docs/TOOL-EVALUATION.md) - Tool comparison and rationale for choosing Playwright.

