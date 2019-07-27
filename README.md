# dind-alternative
Alternative DIND docker in docker distribution.

# Why do you need alternate dind?

RHEL/Centos docker daemon differs from the official one.
 You can compare `docker --help` with `docker-ce --help`.
 Main difference for me is `--add-registry` flag,
 which is not supported by CE and official dockerd daemons.

# How to use?

This image is based on the [official dind](https://hub.docker.com/_/docker)
 and it must be fully compatible with it.

Please watch [official dind](https://hub.docker.com/_/docker) image.
 If you new to DIND, then please use [official dind](https://hub.docker.com/_/docker) .

You need this alternative dind distribution only if you know what you doing!

# How to run?

```bash

$ docker run --privileged --name dind -d \
   --network some-network --network-alias docker \
   -e DOCKER_TLS_CERTDIR=/certs \
   -v some-docker-certs-ca:/certs/ca \
   -v some-docker-certs-client:/certs/client \
   kran0/dind-centos:latest

```

# Tags

[Automated builds](https://hub.docker.com/r/kran0/dind-centos/tags/).

| Repository:Tag | Build description  |
|:-:|---|
| kran0/dind-centos:latest                | latest dockerd with the latest Dockerfile |
| kran0/dind-centos:1.13.1-96.gitb2f74b2  | previously released tagged dockerd |
