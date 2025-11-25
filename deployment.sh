#!/bin/bash
set -e

# Docker Hub credentials
DOCKER_USERNAME="zainabjulaha@gmail.com"
DOCKER_PASSWORD="julaha9112@JZ"

# Docker image info
IMAGE="zainabjulaha/ci-cd-app:latest"
CONTAINER_NAME="ci-cd-app"

# Login to Docker Hub
echo "Logging into Docker Hub..."
echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin

# Pull the latest image from Docker Hub
echo "Pulling latest image: $IMAGE"
docker pull $IMAGE

# Stop and remove old container if exists
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

# Run new container
docker run -d --restart unless-stopped -p 8000:8000 --name $CONTAINER_NAME $IMAGE

echo "Deployment complete: $IMAGE"

