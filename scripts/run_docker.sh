#!/bin/bash

set -e

SCRIPT_DIR=$(echo $(cd $(dirname $0) && pwd))
PROJECT_ROOT="$SCRIPT_DIR/.."
PYTHON_VERSION="3.10"
CONTAINER_NAME="python-sample"

docker run -it \
  --rm \
  -v $PROJECT_ROOT:/app \
  -w /app \
  --name $CONTAINER_NAME \
  -d \
  "python:$PYTHON_VERSION" /bin/bash -c "bash --rcfile <(echo \"trap 'exit 0' TERM\")"
