# Qt Crerator support for Docker

This repository contains some wrapper scripts for Qt Creator which allow to use a Debian container to build a Qt Project. This can be helpfull if you want to develop e.g. a Qt Application in a Debian container.

We can use this under Torizon to develop applications for arm. The idea is to use Debian multiarch and to cross compile. So we don't use qemu to do native compilation. This also means we need two different containers, one for developement (which is amd64/x86 based) and one to run the application (which is arm based).

See Toradex developers page for more information:
https://developer.toradex.com/knowledge-base/torizon-qtcreator

## bin-torizon

Wrapper scripts that wrap tools like qmake, gcc, g++, etc.

## docker

Directory which contains two docker files.

Dockerfile: The Dockerfile which creates an image which should run on the target
Dockerfile.dev: A Dockerfile which creates an image which can be used to cross compile

To build a developement container for arm32 use:
docker build -f Dockerfile.dev -t qt-dev .

To build a developement container for arm64 use:
docker build -f Dockerfile.dev --build-arg ARCH\_ARG=arm64 -t qt-dev .

To build a target container for arm32 use:
docker build -t qt5-target -f Dockerfile .

To build a target container for arm64 use:
docker build -t qt5-target -build-arg BASE\_NAME=arm64v8-debian-qt5-wayland-vivant -f Dockerfile .
