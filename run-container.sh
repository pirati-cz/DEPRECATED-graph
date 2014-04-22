#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker run -t -p 80 -v $DIR/app:/home/app piraticz/graph
