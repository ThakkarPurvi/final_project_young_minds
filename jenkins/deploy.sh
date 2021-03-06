#!/bin/bash

echo "Deploy Stage"

scp docker-compose.yaml jenkins@swarm-manager:/home/jenkins/docker-compose.yaml

ssh jenkins@swarm-manager \
    CREATE_SCHEMA=$CREATE_SCHEMA \
    DOCKER_HUB_CREDS_USR=$DOCKER_HUB_CREDS_USR \
    DATABASE_URI=$DATABASE_URI \
    docker stack deploy --compose-file docker-compose.yaml final_project_young_minds
