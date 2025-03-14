#!/usr/bin/env bash

BUILD_CMD="$1"

if ["${CONTAINER_CMD}" = ""]; then
    CONTAINER_CMD="$(podman version > /dev/null 2>&1 && echo podman)"

fi
if ["${CONTAINER_CMD}" = ""]; then
    CONTAINER_CMD="$(docker version > /dev/null 2>&1 && echo docker)"

fi

echo "container command: ${CONTAINER_CMD}"

"{$CONTAINER_CMD}" run -it  --workdir /work -v  $(pwd):/work  --platform linux/amd64   quay.io/madam/devcontainer/fedora-c:latest "${BUILD_CMD}"




