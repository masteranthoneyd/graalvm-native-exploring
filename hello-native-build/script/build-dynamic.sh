#!/bin/sh

set +e

# Package the compressed executable in a simple scratch container image
../../mvnw -f ../pom.xml clean package
native-image -o app --gc=G1 -march=native -jar App.jar