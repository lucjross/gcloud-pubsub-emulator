#!/usr/bin/env bash

set -e

docker build -t lucjross/gcloud-pubsub-emulator:latest .
docker push docker.io/lucjross/gcloud-pubsub-emulator:latest
