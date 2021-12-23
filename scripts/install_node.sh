#!/bin/bash

set -e

# require: pyright
docker exec -it -u root python-sample bash -c "apt-get update && apt-get install -y --no-install-recommends nodejs npm && npm config set unsafe-perm true && npm install -g npm"

# create home directory
docker exec -it -u root python-sample bash -c "mkdir -p /home/$USER && chown -R $(id -u $USER):$(id -g $USER) /home/$USER"
