#!/bin/bash
docker stop react-container || true
docker rm react-container || true
docker run -d -p 80:80 --name react-container react-dev
