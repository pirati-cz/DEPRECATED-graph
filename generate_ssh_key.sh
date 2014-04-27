#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #"
DIR="$DIR/app/.ssh"

# check arguments
if [ ! -z "$1" ]; then
    DIR="$1"
fi

# create target directory
mkdir -p $DIR

# generate key
ssh-keygen -t rsa -f $DIR/id_rsa

# authorize the public key
cp $DIR/id_rsa.pub $DIR/authorized_keys

exit 0
