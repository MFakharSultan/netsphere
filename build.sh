#!/bin/bash
set -e

# Specify the base URL
BASE_URL=${1:-"https://MFakharSultan.github.io/netsphere"}

echo "Using base URL: $BASE_URL"

# Ensure clean public directory
rm -rf public
mkdir -p public

# Build site from the current branch only
GIT_HASH=$(git rev-parse --short HEAD)
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

echo "Building site from branch '$CURRENT_BRANCH' (commit: $GIT_HASH)"

hugo \
  --minify \
  --themesDir=../.. --source=exampleSite \
  --baseURL "$BASE_URL/" \
  --destination=../public

echo "✅ Build completed"
