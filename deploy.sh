#!/bin/bash
IMAGE=$1
export IMAGE=$IMAGE
docker compose down || true
docker compose pull || true
docker compose up -d
docker ps
