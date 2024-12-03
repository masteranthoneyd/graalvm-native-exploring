#!/bin/sh

set +e

# Package the compressed executable in a simple scratch container image
../../mvnw -f ../pom.xml clean package
docker build -t hello:upx -f alpine-glibc.dynamic.Dockerfile .
docker run --rm hello:upx