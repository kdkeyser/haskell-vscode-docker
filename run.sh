#!/bin/sh

docker run --rm -t -i -v $(dirname $SSH_AUTH_SOCK):$(dirname $SSH_AUTH_SOCK) -v $HOME/.gitconfig:/root/.gitconfig:ro -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:rw --privileged --net=host -v $HOME/.Xauthority:/root/.Xauthority -v $HOME/shared:/root/shared "$@" /bin/bash

