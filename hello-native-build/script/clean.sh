#!/bin/sh

set +e 

rm -f ./App* ./app*

if docker images -q hello | grep -q .; then
   docker images -q hello | awk '{print($1)}' | xargs docker rmi || true
fi

