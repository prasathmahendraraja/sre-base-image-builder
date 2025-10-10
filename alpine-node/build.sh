#!/bin/bash

# Accept Node.js version as an argument
if [ -z "$1" ]; then
  echo "Node.js version is required."
  exit 1
fi
NODE_VERSION=$1

# Build the Docker image with the specified Node.js version
docker build --build-arg NODE_VERSION=$NODE_VERSION -t mahenp5/alpine-node:$NODE_VERSION .