#!/bin/bash

# Playwright Recording Script
# This script installs all dependencies and starts Playwright codegen

echo "================================================"
echo "Playwright Recording Setup"
echo "================================================"
echo ""

# Check if Liferay is running
echo "Make sure Liferay is fully started at http://localhost:8080 before proceeding."
echo ""

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

cd "$PROJECT_ROOT/runtime/playwright"

# Install system dependencies
echo "Step 1: Installing system dependencies..."
npx playwright install-deps
echo "✓ System dependencies installed"
echo ""

# Install npm dependencies
echo "Step 2: Installing npm dependencies..."
npm install
echo "✓ npm dependencies installed"
echo ""

# Install browsers
echo "Step 3: Installing Playwright browsers..."
npx playwright install
echo "✓ Playwright browsers installed"
echo ""

# Start recording
echo "Step 4: Starting Playwright codegen..."
echo "================================================"
echo "Playwright Inspector will open. Record your scenario and close the Inspector when done."
echo "================================================"
echo ""

npx playwright codegen http://localhost:8080

echo ""
echo "================================================"
echo "Recording complete!"
echo "Copy the generated code into tests/*.spec.ts"
echo "================================================"
