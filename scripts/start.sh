#!/usr/bin/bash

cd /var/hello-world
sudo docker system prune -a -f

docker build -t docker-hello-world:latest .
docker run --platform=linux/arm64 -p 8080:8080 -d docker-hello-world:latest