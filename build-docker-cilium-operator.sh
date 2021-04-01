#!/bin/bash

DOCKER_IMAGE_TAG=${1:-mine}
DOCKER_DEV_ACCOUNT=${2:-haruband}

DOCKER_DEV_ACCOUNT=docker.io/${DOCKER_DEV_ACCOUNT} DOCKER_IMAGE_TAG=${DOCKER_IMAGE_TAG} make docker-operator-generic-image

docker push docker.io/${DOCKER_DEV_ACCOUNT}/operator-generic:${DOCKER_IMAGE_TAG}
