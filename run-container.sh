#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #"

echo "Running MongoDB container called mongodb"
MONGO_ID=$(docker run -t -v $DIR/data:/data --name=mongodb -d dockerfile/mongodb mongod)

GRAPH_OPTS="-t -p 80 -v $DIR/app:/home/app --link=mongodb:db"
if [ ! -z "$1" ];
  then
    echo "Running graph with '$@' (to properly init the container don't forget to run /sbin/my_init)"
    docker run -i $GRAPH_OPTS piraticz/graph $@
  else
    echo "Running graph"
    GRAPH_ID=$(docker run $GRAPH_OPTS --name graph -d piraticz/graph)
fi
