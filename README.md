### 介绍

此项目为构建Docker镜像源码，用来生成适用于 [go-micro](https://github.com/asim/go-micro) 框架的 go rpc 文件。

镜像地址：[heqingbao/protoc-gen-go](https://hub.docker.com/r/heqingbao/protoc-gen-go) 

```
docker pull heqingbao/protoc-gen-go
```

### 使用：

1. 运行容器
```
docker run -it --rm protoc-gen-go:1.0
```

2. 创建示例 proto ：

```proto
syntax = "proto3";

option go_package = "go.micor.service.test";

service Greeter {
	rpc Hello(Request) returns (Response) {}
}

message Request {
	string name = 1;
}

message Response {
	string msg = 1;
}
```

3. 生成 go ：

```bash
protoc --proto_path=$GOPATH/src:. --micro_out=./ --go_out=./ greeter.proto
```

将会在同目录下生成两个文件：`greeter.pb.go`、`greeter.pb.micro.go`