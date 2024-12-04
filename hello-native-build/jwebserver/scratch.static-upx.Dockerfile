FROM yangbingdong/graalvm23:ubuntu24-muslib AS native-builder

WORKDIR /tmp/build
ADD . /tmp/build
RUN native-image --static --libc=musl -Os -m jdk.httpserver -o jwebserver.static
RUN upx --lzma --best -o jwebserver.static-upx jwebserver.static

FROM scratch
COPY --from=native-builder /tmp/build/jwebserver.static-upx /jwebserver.static-upx
COPY index.html /web/index.html
EXPOSE 8000
ENTRYPOINT ["/jwebserver.static-upx", "-b", "0.0.0.0", "-d", "/web"]