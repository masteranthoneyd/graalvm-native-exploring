#!/bin/sh

set +e 

rm -f ./App* ./app*
docker images -q hello | awk '{print($1)}' | xargs docker rmi || true
