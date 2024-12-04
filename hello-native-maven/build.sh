#!/bin/sh

set +e

../mvnw -f ./pom.xml -Pnative -DskipTests clean package