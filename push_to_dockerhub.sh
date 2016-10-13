#!/bin/bash
docker_push() {
  docker login
  docker build -t mingqianye/votable-api:latest .
  docker push mingqianye/votable-api:latest
}

docker_push
