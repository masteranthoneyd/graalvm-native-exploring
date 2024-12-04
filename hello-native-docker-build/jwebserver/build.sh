#!/bin/sh

docker build . -f jvm-base.Dockerfile -t jwebserver:jvm

docker build . -f scratch.static-upx.Dockerfile -t jwebserver:static-upx