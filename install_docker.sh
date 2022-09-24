#!/bin/bash
apt remove docker docker-engine docker.io containerd runc
apt install --no-install-recommends apt-transport-https ca-certificates curl gnupg2
apt install docker-ce docker-ce-cli containerd.io
DOCKER_DIR=/mnt/wsl/shared-docker
mkdir -pm o=,ug=rwx "$DOCKER_DIR"
echo "{\"hosts\": [\"unix:///mnt/wsl/shared-docker/docker.sock\"],\"iptables\": false}">/etc/docker/daemon.json
dockerd
docker -H unix:///mnt/wsl/shared-docker/docker.sock run --rm hello-world
