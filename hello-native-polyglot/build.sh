#!/bin/sh

set +e

../mvnw -f ./pom.xml -Pnative -DskipTests clean package

./target/PolyglotNative <<EOF
{"GraalVM":{"description":"Language Abstraction Platform","supports":["combining languages","embedding languages","creating native images"],"languages": ["Java", "JavaScript", "Python"]}}
EOF