#!/bin/sh

set +e

# Package the compressed executable in a simple scratch container image
../../mvnw -f ../pom.xml clean package
docker build -t hello:upx -f scratch.static-upx.Dockerfile .
docker run --rm hello:upx