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
#docker pull piraticz/graph (not yet on index.docker.io => must be build)
cp -f ./ssh_key.pub.dist ./ssh_key.pub
docker build -t "piraticz/graph" . # replace

# build image with ssh key if provided
if [ ! -z "$2" ]; then
    cp -f "$2" ./ssh_key.pub
    docker build -t "piraticz/graph-key" .
fi

exit 0
