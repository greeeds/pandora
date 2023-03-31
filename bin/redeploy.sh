#!/bin/bash

git -C /home/projects/pandora/ pull
git -C /home/projects/2/pandora_server/ pull
docker-compose -f /home/projects/pandora/docker-compose.yml up -d --build
docker-compose -f /home/projects/2/pandora_server/docker-compose.yml up -d --build

docker rmi $(docker images -qf "dangling=true")
