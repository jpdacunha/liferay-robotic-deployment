#!/bin/bash
echo " Cleaning Liferay workspace plugins ..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

cd "$PROJECT_ROOT/liferay-workspace"
./gradlew clean

