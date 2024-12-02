FROM yangbingdong/graalvm23:ubuntu24 AS native-builder

WORKDIR /tmp/build
ADD . /tmp/build
RUN native-image -o app -jar App.jar

FROM frolvlad/alpine-glibc:glibc-2.34
COPY --from=native-builder /tmp/build/app /app
ENTRYPOINT ["/app"]