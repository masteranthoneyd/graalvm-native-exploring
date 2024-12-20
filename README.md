
* `hello-native-build`: 演示了通过 `native-image` 工具以及在 Docker 中构建一个基本的二进制可执行文件（包括 fully static native image），同时也演示了通过 upx 压缩可执行文件。
* `hello-native-maven`: 演示了通过 Maven 插件，在 Maven 生命周期 Package 阶段调用 native-image 命令构建可执行文件。