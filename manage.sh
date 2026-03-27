#!/bin/bash

# Script centralisé pour gérer tous les scripts du projet Liferay Robotic Deployment

set -e

WORKSPACE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_DIR="$WORKSPACE_DIR/scripts"
BUILD_SCRIPTS_DIR="$SCRIPTS_DIR/build"
RUNTIME_SCRIPTS_DIR="$SCRIPTS_DIR/runtime"
PLAYWRIGHT_SCRIPTS_DIR="$RUNTIME_SCRIPTS_DIR/playwright"
LIFERAY_WORKSPACE_DIR="$WORKSPACE_DIR/liferay-workspace"

# Couleurs pour l'affichage
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Vérifier que les répertoires existent
check_directories() {
    if [ ! -d "$SCRIPTS_DIR" ]; then
        echo -e "${RED}Erreur: Le répertoire $SCRIPTS_DIR n'existe pas${NC}"
        exit 1
    fi
    if [ ! -d "$LIFERAY_WORKSPACE_DIR" ]; then
        echo -e "${RED}Erreur: Le répertoire $LIFERAY_WORKSPACE_DIR n'existe pas${NC}"
        exit 1
    fi
}

# Fonction pour afficher l'utilisation générale
usage() {
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}  Gestionnaire Liferay Robotic Deploy${NC}"
    echo -e "${BLUE}========================================${NC}"
    echo ""
    echo "Usage: $0 [category] [command]"
    echo ""
    echo -e "${GREEN}Catégories disponibles:${NC}"
    echo ""
    echo -e "${YELLOW}  build${NC}                - Commandes de build et déploiement"
    echo -e "${YELLOW}  runtime${NC}              - Commandes d'environnement Docker/Runtime"
    echo -e "${YELLOW}  playwright${NC}           - Commandes Playwright (tests automatisés)"
    echo -e "${YELLOW}  help${NC}                 - Afficher cette aide"
    echo ""
    echo "Exemples:"
    echo "  $0 build help"
    echo "  $0 runtime help"
    echo "  $0 playwright help"
    echo ""
}

# Fonction pour afficher l'aide des commandes de build
build_usage() {
    echo -e "${BLUE}========== Commandes Build ===========${NC}"
    echo ""
    echo -e "${GREEN}Commandes disponibles:${NC}"
    echo ""
    echo -e "${YELLOW}  build${NC}               - Construire les plugins Liferay (gradlew clean deploy)"
    echo -e "${YELLOW}  clean${NC}               - Nettoyer les plugins Liferay (gradlew clean)"
    echo -e "${YELLOW}  deploy${NC}              - Déployer les artefacts dans runtime"
    echo -e "${YELLOW}  all${NC}                 - Exécuter: clean, build, puis deploy"
    echo -e "${YELLOW}  help${NC}                - Afficher cette aide"
    echo ""
}

# Fonction pour afficher l'aide des commandes runtime
runtime_usage() {
    echo -e "${BLUE}========== Commandes Runtime ===========${NC}"
    echo ""
    echo -e "${GREEN}Commandes disponibles:${NC}"
    echo ""
    echo -e "${YELLOW}  start${NC}               - Démarrer l'environnement Docker"
    echo -e "${YELLOW}  stop${NC}                - Arrêter l'environnement Docker"
    echo -e "${YELLOW}  clean${NC}               - Nettoyer l'environnement Docker"
    echo -e "${YELLOW}  logs${NC}                - Afficher les logs Liferay"
    echo -e "${YELLOW}  help${NC}                - Afficher cette aide"
    echo ""
}

# Fonction pour afficher l'aide des commandes Playwright
playwright_usage() {
    echo -e "${BLUE}========== Commandes Playwright ===========${NC}"
    echo ""
    echo -e "${GREEN}Commandes disponibles:${NC}"
    echo ""
    echo -e "${YELLOW}  start${NC}               - Démarrer Playwright"
    echo -e "${YELLOW}  stop${NC}                - Arrêter Playwright"
    echo -e "${YELLOW}  record${NC}              - Enregistrer un scénario Playwright"
    echo -e "${YELLOW}  run${NC}                 - Exécuter les tests Playwright"
    echo -e "${YELLOW}  help${NC}                - Afficher cette aide"
    echo ""
}

# Fonction pour exécuter un script
run_script() {
    local script_path=$1
    local script_name=$(basename "$script_path")
    
    if [ ! -f "$script_path" ]; then
        echo -e "${RED}Erreur: Le script $script_name n'existe pas à $script_path${NC}"
        return 1
    fi
    
    if [ ! -x "$script_path" ]; then
        echo -e "${YELLOW}Rendre le script exécutable...${NC}"
        chmod +x "$script_path"
    fi
    
    echo -e "${GREEN}Exécution: $script_name${NC}"
    echo ""
    "$script_path"
}

# Fonction pour exécuter la commande build
build_command() {
    case "${1:-help}" in
        build)
            run_script "$BUILD_SCRIPTS_DIR/build.sh"
            ;;
        clean)
            run_script "$BUILD_SCRIPTS_DIR/clean.sh"
            ;;
        deploy)
            run_script "$BUILD_SCRIPTS_DIR/deploy.sh"
            ;;
        all)
            echo -e "${CYAN}Exécution: clean -> build -> deploy${NC}"
            build_command "clean"
            build_command "build"
            build_command "deploy"
            ;;
        help|--help|-h)
            build_usage
            ;;
        *)
            echo -e "${RED}Commande build inconnue: $1${NC}"
            echo ""
            build_usage
            exit 1
            ;;
    esac
}

# Fonction pour exécuter les commandes runtime
runtime_command() {
    case "${1:-help}" in
        start)
            run_script "$RUNTIME_SCRIPTS_DIR/start-environment.sh"
            ;;
        stop)
            run_script "$RUNTIME_SCRIPTS_DIR/stop.sh"
            ;;
        clean)
            run_script "$RUNTIME_SCRIPTS_DIR/clean-environment.sh"
            ;;
        logs)
            run_script "$RUNTIME_SCRIPTS_DIR/start-logs.sh"
            ;;
        help|--help|-h)
            runtime_usage
            ;;
        *)
            echo -e "${RED}Commande runtime inconnue: $1${NC}"
            echo ""
            runtime_usage
            exit 1
            ;;
    esac
}

# Fonction pour exécuter les commandes Playwright
playwright_command() {
    case "${1:-help}" in
        start)
            run_script "$PLAYWRIGHT_SCRIPTS_DIR/start-playwright.sh"
            ;;
        stop)
            run_script "$PLAYWRIGHT_SCRIPTS_DIR/stop-playwright.sh"
            ;;
        record)
            run_script "$PLAYWRIGHT_SCRIPTS_DIR/record-playwright.sh"
            ;;
        run)
            run_script "$PLAYWRIGHT_SCRIPTS_DIR/run-playwright.sh"
            ;;
        help|--help|-h)
            playwright_usage
            ;;
        *)
            echo -e "${RED}Commande playwright inconnue: $1${NC}"
            echo ""
            playwright_usage
            exit 1
            ;;
    esac
}

# Script principal
check_directories

case "${1:-help}" in
    build)
        build_command "${2:-help}"
        ;;
    runtime)
        runtime_command "${2:-help}"
        ;;
    playwright)
        playwright_command "${2:-help}"
        ;;
    help|--help|-h)
        usage
        ;;
    *)
        echo -e "${RED}Catégorie inconnue: $1${NC}"
        echo ""
        usage
        exit 1
        ;;
esac
