#!/usr/bin/env bash

# REPO=https://github.com/.../... TOKEN=... . local-gha.sh

docker run -it --rm ghcr.io/actions/actions-runner:latest sh -c " \
    ./config.sh --url $REPO --token $TOKEN --unattended && \
    ./run.sh \
"
