#!/bin/bash

# Fail fast
set -e

TAG=${1}
PROJECT=${2}
BUILD_FOLDER=${3}

echo "Verify if docker is installed & running"
which docker > /dev/null && docker ps > /dev/null || { echo 'ERROR: docker is not running' ; exit 1; }

echo "Connect to google cloud"
gcloud auth print-access-token | docker login -u oauth2accesstoken --password-stdin https://gcr.io

echo "Running ${PROJECT} from ${BUILD_FOLDER}/Dockerfile"

echo "Build image"
docker build -t gcr.io/"${PROJECT}"/"${TAG}" "${BUILD_FOLDER}"

echo "Push image (latest and random generated)"
docker push gcr.io/"${PROJECT}"/"${TAG}"
