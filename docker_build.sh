#!/bin/bash

IMAGE_NAME="truelifer/jenkins-with-docker-img"

if [ $# -eq 0 ];
then
  echo "$0: Missing Docker Build Version"
  exit 1
elif [ $# -gt 1 ];
then
  echo "$0: Too many arguments: $*"
  exit 1
else
  echo "Docker Build Starts : $IMAGE_NAME:$1"
fi

docker build -t $IMAGE_NAME:$1 .
docker build -t $IMAGE_NAME:latest .