#!/bin/bash

DOCKER_IMAGE_TAG=${1:-mine}
DOCKER_DEV_ACCOUNT=${2:-haruband}

DOCKER_DEV_ACCOUNT=docker.io/${DOCKER_DEV_ACCOUNT} DOCKER_IMAGE_TAG=${DOCKER_IMAGE_TAG} make docker_operator-generic-image

docker push docker.io/${DOCKER_DEV_ACCOUNT}/cilium-dev:${DOCKER_IMAGE_TAG}
