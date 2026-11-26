#!/usr/bin/env bash
set -euo pipefail
IMAGE="localhost:5050/notes-web"
VERSION="1.0.0"
docker build -t "$IMAGE:$VERSION" -t "$IMAGE:latest" .
docker push "$IMAGE:$VERSION"
docker push "$IMAGE:latest"
