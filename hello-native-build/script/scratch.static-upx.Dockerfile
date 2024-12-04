FROM yangbingdong/graalvm23:ubuntu24-muslib AS native-builder

WORKDIR /tmp/build
ADD . /tmp/build
RUN native-image -Os --static --libc=musl -o app -jar App.jar
RUN upx --lzma --best -o app.upx app

FROM scratch
COPY --from=native-builder /tmp/build/app.upx /app.upx
ENTRYPOINT ["/app.upx"]