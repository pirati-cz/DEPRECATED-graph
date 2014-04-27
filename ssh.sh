#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #"
DIR="$DIR/app/.ssh"

IP="$( docker inspect $(docker ps | grep "piraticz/graph:latest" | awk '{ print $1 }') | grep IPAddress | sed -r "s/[\" a-zA-Z:,]//g" )"

ssh-keygen -q -f $HOME/.ssh/known_hosts -R $IP
ssh -i $DIR/id_rsa app@$IP

