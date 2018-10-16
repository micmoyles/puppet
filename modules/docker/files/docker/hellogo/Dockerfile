FROM golang:1.11.1-stretch
COPY src/configure.sh /usr/local/bin/configure.sh 
ENV GOPATH /usr/local/goprojects
COPY src/hello.go /usr/local/goprojects/src/hello/hello.go
#COPY src/hello.go /go/src/hello/hello.go 
CMD ["go","run","hello"]
