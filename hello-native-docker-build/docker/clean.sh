#!/bin/sh

set +e 

rm App.jar
docker images -q hello | awk '{print($1)}' | xargs docker rmi || true
