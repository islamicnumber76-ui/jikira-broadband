#!/bin/bash
set -e

# Download the ZIP file from GitHub raw content
REPO_URL="https://github.com/islamicnumber76-ui/jikira-broadband/raw/main/agon-agent_1-6a511c00%20(1).zip"
ZIP_FILE="/tmp/agon-agent.zip"
EXTRACT_DIR="/tmp/agon-extract"

echo "Downloading ZIP file from GitHub..."
curl -L -o "$ZIP_FILE" "$REPO_URL"

echo "Extracting ZIP to $EXTRACT_DIR..."
mkdir -p "$EXTRACT_DIR"
unzip -q "$ZIP_FILE" -d "$EXTRACT_DIR"

echo "Contents of extracted directory:"
find "$EXTRACT_DIR" -type f -name "package.json" -o -name "package-lock.json" -o -name "pnpm-lock.yaml" -o -name "yarn.lock" | head -20

echo ""
echo "Looking for package.json files..."
find "$EXTRACT_DIR" -type f -name "package.json" -exec echo "Found: {}" \; -exec cat {} \;

echo ""
echo "Directory structure:"
ls -la "$EXTRACT_DIR" | head -50

echo ""
echo "Cleanup..."
rm -f "$ZIP_FILE"
