# Hello Native

 本项目 demo 通过 Docker 以及在本地 Linux 构建一个基础的 GraalVM Native Image 二进制可执行文件.

**Prerequisites**:
* JDK 23
* Docker

如果在本地构建, 需要额外的:
* `muslib`
* `upx`

**运行:**
```
cd script
./build-docker-static-upx.sh
```

* 该脚本会使用 `mvnw` 构建项目
* package 完成后由 Maven 插件 `maven-dependency-plugin` 将 target 中的 jar 包复制到 script 目录中
* 通过指定 `scratch.static-upx.Dockerfile` 文件构建 Docker 镜像
  * 该 Dockerfile 使用 _**[graalvm23:ubuntu24-muslib](https://github.com/masteranthoneyd/dockerfile/blob/master/graalvm/23/ubuntu24-muslib/Dockerfile)**_ 作为 builder 镜像
  * 构建 static 类型的二进制可执行
  * 并通过 _**[upx](https://upx.github.io/)**_ 对二进制文件进行压缩
  * 将压缩后的可执行文件放到二阶段 scratch 镜像中

除了 build-docker-static-upx.sh, 还有其他的几个构建脚本:

* `build-docker-dynamic.sh`: 利用 Docker 构建非 static Native Image, 并打包成 Docker 镜像
* `build-static-upx.sh`: 在本地构建 static 的二进制文件
* `build-dynamic.sh`: 在本地构建非 static 的二进制文件


`alpine-glibc.dynamic.Dockerfile` 提供非 static 的二进制文件构建, 这种方式构建出来的体积比 static 的大, 但兼容性会好一些.

下面是使用 static 与非 static 构建出来的镜像, 可以看出 static 镜像的体积确实很小, 因为 static 的二进制文件可以使用 scratch 镜像作为基础镜像, 而非 static 的二进制文件需要 glic 的支持.
```
REPOSITORY       TAG           IMAGE ID       CREATED              SIZE
hello            dynamic       858984402b3a   About a minute ago   22.9MB
hello            upx           981fa70ba5d8   10 minutes ago       1.3MB
```