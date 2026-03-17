#!/usr/bin/env bash

# Simple sanity check script for the project.
# You can extend this script to run linters, unit tests, or build steps.

set -euo pipefail

echo "Running basic sanity checks..."

if [[ ! -f "myapp/index.html" ]]; then
  echo "ERROR: myapp/index.html not found." >&2
  exit 1
fi

if [[ ! -f "myapp/styles.css" ]]; then
  echo "ERROR: myapp/styles.css not found." >&2
  exit 1
fi

if [[ ! -f "myapp/script.js" ]]; then
  echo "ERROR: myapp/script.js not found." >&2
  exit 1
fi

if ! grep -q "March 15, 2026" myapp/index.html; then
  echo "ERROR: Today's date (March 15, 2026) not found in index.html." >&2
  exit 1
fi

echo "All required files are present and date check passed."

# Check that the page has a proper title
if ! grep -q "<title>" myapp/index.html; then
  echo "ERROR: <title> tag not found in index.html." >&2
  exit 1
fi

# Check for HoneySingh's name in index.html (will FAIL initially)
if ! grep -q "HoneySingh" myapp/index.html; then
  echo "ERROR: HoneySingh's name not found in index.html." >&2
  exit 1
fi