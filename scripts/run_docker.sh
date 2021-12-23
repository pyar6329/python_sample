#!/bin/bash

set -e

SCRIPT_DIR=$(echo $(cd $(dirname $0) && pwd))
PROJECT_ROOT="$SCRIPT_DIR/.."
PYTHON_VERSION="3.10"
CONTAINER_NAME="python-sample"

docker run -it \
  --rm \
  -e "PATH=/home/$USER/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" \
  -v /etc/group:/etc/group:ro \
  -v /etc/passwd:/etc/passwd:ro \
  -v $PROJECT_ROOT:/app \
  -w /app \
  --name $CONTAINER_NAME \
  -u $(id -u $USER):$(id -g $USER) \
  -d \
  "python:$PYTHON_VERSION" /bin/bash -c "bash --rcfile <(echo \"trap 'exit 0' TERM\")"
