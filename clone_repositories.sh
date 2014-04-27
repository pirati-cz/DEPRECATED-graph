#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #"
DIR="$DIR/app"

# check arguments
if [ ! -z "$1" ]; then
    DIR="$1"
fi

# create target directory and cd there
mkdir -p $DIR
cd $DIR

git clone https://github.com/pirati-cz/graph-common.git graph-common

exit 0
