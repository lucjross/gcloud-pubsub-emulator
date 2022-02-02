gcloud-pubsub-emulator
----------------------
This repository contains the Docker configuration for Google's PubSub emulator. It's mainly the dockerization and documentation of https://github.com/prep/pubsubc 

Installation
------------
A pre-built Docker container is available for Docker Hub:

```
docker run --rm -ti -p 8681:8681 messagebird/gcloud-pubsub-emulator:latest
```

Or, you can build this repository yourself:

```
docker build -t gcloud-pubsub-emulator:latest .
docker run --rm -ti -p 8681:8681 gcloud-pubsub-emulator:latest
```

Usage
-----
After you've ran the above-mentioned `docker run` command, you should be able to use any app that has PubSub implemented and point it to your Docker container by specifying the `PUBSUB_EMULATOR_HOST` environment variable.

```
env PUBSUB_EMULATOR_HOST=localhost:8681 ./myapp
```

or

```
export PUBSUB_EMULATOR_HOST=localhost:8681
./myapp
```

### Automatic topic and subscription creation
todo

### wait-for, wait-for-it
If you're using this Docker image in a docker-compose setup or something similar, you might have leveraged scripts like [wait-for](https://github.com/eficode/wait-for) or [wait-for-it](https://github.com/vishnubob/wait-for-it) to detect when the PubSub service comes up before starting a container that depends on it being up. If you're _not_ using the above-mentioned _PUBSUB_PROJECT_ environment variable, you can simply check if port `8681` is available. If you _do_ depend on one or more _PUBSUB_PROJECT_ environment variables, you should check for the availability of port `8682` as that one will become available once all the topics and subscriptions have been created.
