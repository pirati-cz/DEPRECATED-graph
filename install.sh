#!/bin/bash

# check arguments
if [ -z "$1" ]; then
    echo "Usage: install.sh <installation directory> [ <ssh public key> ]"
    exit 1
fi

# create target directory and cd there
mkdir -p "$1"
cd "$1"

# clone base
git clone https://github.com/pirati-cz/graph.git .

# clone repositories
mkdir -p $1/repositories
cd $1/repositories
git clone https://github.com/pirati-cz/graph-common.git graph-common
cd ..

# pull official image
docker pull piraticz/graph

# build image with ssh key if provided
if [ -z "$2" ]; then
    cp -f ssh_key.pub.dist ./Dockerfile-with-key/ssh_key.pub
else
    cp -f "$2" ./Dockerfile-with-key/ssh_key.pub
fi
docker build -t "piraticz/graph-key" ./Dockerfile-with-key/Dockerfile

exit 0
