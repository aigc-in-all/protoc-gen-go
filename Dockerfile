FROM golang:1.17.6

RUN apt-get update && \
	apt-get install unzip

RUN wget https://github.com/protocolbuffers/protobuf/releases/download/v3.19.4/protoc-3.19.4-linux-aarch_64.zip && \
	unzip -o protoc-3.19.4-linux-aarch_64.zip -d /usr/local bin/protoc && \
	unzip -o protoc-3.19.4-linux-aarch_64.zip -d /usr/local include/* && \
	rm -rf protoc-3.19.4-linux-aarch_64.zip

ENV GOPROXY=https://mirrors.aliyun.com/goproxy/

RUN go get -u google.golang.org/protobuf && \
	go get -u github.com/golang/protobuf/protoc-gen-go && \
	go install go-micro.dev/v4/cmd/protoc-gen-micro@v4

ENTRYPOINT ["/bin/bash"]