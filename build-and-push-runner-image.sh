#!/bin/bash

# Call like:
#
### PE_REGISTRY=10.215.145.130/ ./build-runner-image.sh v2.326.0
# or
### PE_REGISTRY=10.215.145.130/ ./build-runner-image.sh 2.326.0

# Ensure the script exits on error
set -e

# Check if RUNNER_VERSION is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <RUNNER_VERSION>"
  exit 1
fi

# Assign the first argument to RUNNER_VERSION (remove "v" if included in argument)
RUNNER_VERSION=${1#v}
echo "Building new runner image for .tar.gz release <${RUNNER_VERSION}>!"

# Build the Docker image with the provided RUNNER_VERSION and tag it with the version_release
# + update the :latest tag (so we can just pull that for all subsequent redeploys)
docker buildx build --platform linux/amd64 \
  --build-arg RUNNER_VERSION="$RUNNER_VERSION" \
  -t fcabrera01/actions-image:latest \
  -t fcabrera01/actions-image:v${RUNNER_VERSION} \
  --push .
