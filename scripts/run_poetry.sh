#!/bin/bash

set -e

SCRIPT_DIR=$(echo $(cd $(dirname $0) && pwd))
PROJECT_ROOT="$SCRIPT_DIR/.."

export PATH="/root/.local/bin:$PATH"
if [ $(whoami) != "root" ]; then
  export PATH="/home/$(whoami)/.local/bin:$PATH"
fi

# install poetry
if ! [ -e "/.dockerenv" ]; then
  echo "This is not in container. Please run in container"
  exit 1
fi

cd $PROJECT_ROOT

if ! type poetry > /dev/null; then
  pip install poetry
fi

poetry config virtualenvs.create false
poetry install
