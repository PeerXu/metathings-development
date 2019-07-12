FROM golang:1.10-alpine

RUN apk add git make protobuf
RUN go get github.com/golang/protobuf/proto && \
    go get github.com/golang/protobuf/protoc-gen-go && \
    go get github.com/mwitkow/go-proto-validators/protoc-gen-govalidators
