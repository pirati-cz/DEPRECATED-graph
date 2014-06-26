#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #"
DIR="$DIR/graph"

# check arguments
if [ ! -z "$1" ]; then
    DIR="$1"
fi

# create target directory and cd there
mkdir -p $DIR
cd $DIR

# clone base
git clone https://github.com/pirati-cz/graph.git $DIR

# create other directories
mkdir -p $DIR/app
mkdir -p $DIR/data/db
mkdir -p $DIR/ssh

# clone repositories
cd $DIR/app
git clone https://github.com/pirati-cz/graph-common.git graph-common
git clone https://github.com/pirati-cz/graph-cli.git graph-cli
git clone https://github.com/pirati-cz/graph-rest.git graph-rest
cd $DIR

# generate ssh key
./generate_ssh_key.sh

# container environment for 'app' user 
echo 'source /etc/container_environment.sh' > $DIR/app/.bashrc

exit 0
