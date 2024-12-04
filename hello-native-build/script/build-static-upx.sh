#!/bin/sh

set +e

# Package the compressed executable in a simple scratch container image
../../mvnw -f ../pom.xml clean package
native-image -Os --static --libc=musl -o app -jar App.jar
upx --lzma --best -o app.upx app