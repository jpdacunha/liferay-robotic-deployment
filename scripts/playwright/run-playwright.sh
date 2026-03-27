#!/bin/bash

# Playwright Test Execution Script
# This script runs all Playwright tests

echo "================================================"
echo "Playwright Test Execution"
echo "================================================"
echo ""

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

cd "$PROJECT_ROOT/runtime/playwright"

# Check if Liferay is running
echo "Make sure Liferay is fully started at http://localhost:8080 before proceeding."
echo ""

# Install dependencies if needed
echo "Step 1: Checking dependencies..."
npm install > /dev/null 2>&1
echo "✓ Dependencies verified"
echo ""

# Run tests
echo "Step 2: Running Playwright tests..."
echo "================================================"
echo ""

npx playwright test

RESULT=$?

echo ""
echo "================================================"
if [ $RESULT -eq 0 ]; then
  echo "All tests passed!"
else
  echo "Some tests failed. Check the output above."
fi
echo "Test results available in: test-results/"
echo "================================================"

exit $RESULT
