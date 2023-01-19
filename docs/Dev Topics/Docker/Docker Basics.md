# Docker Basics

## Overview

## Commands

Here are some of the most common commands used when working with Docker:

1. `docker run`: Runs a command in a new container.
2. `docker start`: Starts one or more stopped containers.
3. `docker stop`: Stops one or more running containers.
4. `docker rm`: Removes one or more containers.
5. `docker ps`: Lists all running containers.
6. `docker images`: Lists all images on the host.
7. `docker pull`: Pulls an image from a registry.
8. `docker push`: Pushes an image to a registry.
9. `docker build`: Builds an image from a Dockerfile.
10. `docker exec`: Runs a command in a running container.
11. `docker logs`: Fetches the logs of a container.
12. `docker inspect`: Inspects a container or image and returns low-level information.
13. `docker network`: Manage Docker networks
14. `docker volume`: Manage Docker volumes
15. `docker system`: Manage Docker as a whole

### Run

``` sh title=""
docker run -d -p 8080:80 --name my-web-app nginx
```

This command runs a `new` `container` based on the `nginx` `image`, `maps` `port` `8080` on the `host` to `port` `80` in the container, and runs the container in `detached mode (-d)` with the name `my-web-app`.

### Start

``` sh title=""
docker start my-web-app
```

This command starts the container named `my-web-app`.

### Stop

``` sh title=""
docker stop my-web-app
```

This command stops the container named `my-web-app`.

### Remove

``` sh
docker rm my-web-app
```

This command removes the container named `my-web-app`.

### List Running Containers

``` sh
docker ps
```

This command lists all running containers.

### List Images

``` sh
docker images
```

This command lists all images on the host.

### Pull

``` sh
docker pull nginx
```

This command pulls the nginx image from the Docker registry.

### Push

``` sh
docker push my-web-app:v1
```

This command pushes an image named my-web-app with the tag v1 to a registry.

### Build

``` sh
docker build -t my-web-app .
```

This command builds an image named my-web-app from the Dockerfile in the current directory (.).

### Exec

``` sh
docker exec -it my-web-app bash
```

This command runs the bash command inside the running container named my-web-app, and allocates a TTY for the command to run with -it

### Logs

``` sh
docker logs my-web-app
```

This command fetches the logs of the container named my-web-app.

### Inspect

``` sh
docker inspect my-web-app
```

This command inspects the container named my-web-app and returns low-level information about the container.

### Network

``` sh
docker network create my-network
```

This command creates a new network named my-network

### Volume

``` sh
docker volume create my-volume
```

This command creates a new volume named my-volume

### System

``` sh
docker system prune
```

This command removes all stopped containers, all networks not used by at least one container, all images without at least one container associated to them and all build cache

## Sample Docker Files

## FAQ

## References

- [Docker Hub](https://hub.docker.com/)
