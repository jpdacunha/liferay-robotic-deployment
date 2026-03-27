#!/bin/bash

# Playwright Test Execution Script
# This script allows selecting which tests to run

echo "================================================"
echo "Playwright Test Execution"
echo "================================================"
echo ""

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"

cd "$PROJECT_ROOT/runtime/playwright"

# Check if Liferay is running
echo "Make sure Liferay is fully started at http://localhost:8080 before proceeding."
echo ""

# Install dependencies if needed
echo "Step 1: Checking dependencies..."
npm install > /dev/null 2>&1
echo "✓ Dependencies verified"
echo ""

# Find all test files
echo "Step 2: Available tests:"
echo "================================================"

# Create array of test files
TESTS=()
TEST_NAMES=()
INDEX=1

for test_file in tests/*.spec.ts; do
  if [ -f "$test_file" ]; then
    test_name=$(basename "$test_file")
    TESTS+=("$test_file")
    TEST_NAMES+=("$test_name")
    echo "$INDEX) $test_name"
    INDEX=$((INDEX + 1))
  fi
done

echo "$INDEX) Run all tests"
echo "0) Exit"
echo ""

# Prompt user for selection
while true; do
  read -p "Select a test to run (0-$INDEX): " choice
  
  # Validate input
  if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 0 ] && [ "$choice" -le "$INDEX" ]; then
    break
  else
    echo "Invalid selection. Please enter a number between 0 and $INDEX."
  fi
done

echo ""

# Handle user choice
if [ "$choice" -eq 0 ]; then
  echo "Exiting..."
  exit 0
elif [ "$choice" -eq "$INDEX" ]; then
  # Run all tests
  echo "Running all tests..."
  echo "================================================"
  echo ""
  npx playwright test
  RESULT=$?
else
  # Run specific test
  TEST_INDEX=$((choice - 1))
  SELECTED_TEST="${TESTS[$TEST_INDEX]}"
  SELECTED_NAME="${TEST_NAMES[$TEST_INDEX]}"
  
  echo "Running test: $SELECTED_NAME"
  echo "================================================"
  echo ""
  npx playwright test "$SELECTED_TEST"
  RESULT=$?
fi

echo ""
echo "================================================"
if [ $RESULT -eq 0 ]; then
  echo "✓ Tests passed!"
else
  echo "✗ Some tests failed. Check the output above."
fi
echo "Test results available in: test-results/"
echo "================================================"

exit $RESULT
