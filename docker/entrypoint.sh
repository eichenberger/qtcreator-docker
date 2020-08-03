#!/bin/bash

mkdir /run/sshd && /usr/sbin/sshd
env > /etc/environment
/bin/bash $@
