#!/usr/bin/env bash

IMAGE_NAME="hieunguyen3005/my-java-app"
VERSION="1.0.$BUILD_NUMBER"

docker build -t $IMAGE_NAME:$VERSION .

echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
docker push $IMAGE_NAME:$VERSION
docker logout
