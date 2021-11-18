#!/bin/bash

set -e

export PATH="/root/.local/bin:$PATH"
if [ $(whoami) != "root" ]; then
  export PATH="/home/$(whoami)/.local/bin:$PATH"
fi

# install poetry
if ! [ -e "/.dockerenv" ]; then
  echo "This is not in container. Please run in container"
  exit 1
fi

if ! type poetry > /dev/null; then
  pip install poetry
fi

poetry config virtualenvs.create false
poetry install
