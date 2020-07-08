#!/bin/bash

mkdir /run/sshd && /usr/sbin/sshd
mkdir -p /tmp/.X11-unix
/bin/bash $@
