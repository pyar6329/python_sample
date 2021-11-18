#!/bin/bash

set -e

SCRIPT_DIR=$(echo $(cd $(dirname $0) && pwd))

docker run -it --rm -v $SCRIPT_DIR:/app -w /app "python:3.10" /bin/bash
