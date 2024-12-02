# Hello Native

 本项目 demo 通过 Docker 构建一个基础的 GraalVM Native Image

**Prerequisites**:
* JDK 23
* Docker

**运行:**
```
cd docker
./build.sh
```

* 该脚本会使用 `mvnw` 构建项目
* package 完成后由 Maven 插件 `maven-dependency-plugin` 将 target 中的 jar 包复制到 docker 目录中
* 通过指定 `scratch.static-upx.Dockerfile` 文件构建 Docker 镜像
  * 该 Dockerfile 使用 _**[graalvm23:ubuntu24-muslib](https://github.com/masteranthoneyd/dockerfile/blob/master/graalvm/23/ubuntu24-muslib/Dockerfile)**_ 作为 builder 镜像
  * 构建 static 类型的二进制可执行
  * 并通过 _**[upx](https://upx.github.io/)**_ 对二进制文件进行压缩


另外 `alpine-glibc.dynamic.Dockerfile` 提供非 static 的二进制文件构建, 这种方式构建出来的体积比 static 的大, 但兼容性会好一些.

下面是使用 static 与非 static 构建出来的镜像, 可以看出 static 镜像的体积确实很小, 因为 static 的二进制文件可以使用 scratch 镜像作为基础镜像, 而非 static 的二进制文件需要 glic 的支持.
```
REPOSITORY       TAG           IMAGE ID       CREATED              SIZE
hello            dynamic       858984402b3a   About a minute ago   22.9MB
hello            upx           981fa70ba5d8   10 minutes ago       1.3MB
```