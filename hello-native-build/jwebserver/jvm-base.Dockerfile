FROM yangbingdong/graalvm23:ubuntu24
COPY index.html /web/index.html
EXPOSE 8000
ENTRYPOINT ["java", "-m", "jdk.httpserver", "-b", "0.0.0.0", "-d", "/web"]