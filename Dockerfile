FROM nayotta/protoc

RUN go get -u -v github.com/golang/protobuf/proto && \
    go get -u -v github.com/golang/protobuf/protoc-gen-go && \
    go get -u -v github.com/mwitkow/go-proto-validators/protoc-gen-govalidators
RUN apt update && \
    apt install -y cmake liblz4-dev libsasl2-dev libssl-dev zlib1g-dev && \
    cd ~ && \
    git clone https://github.com/Tencent/rapidjson.git && \
    mkdir -p rapidjson/build && \
    cd rapidjson/build && \
    cmake .. && \
    make && \
    make install && \
    cd ~ && \
    git clone https://github.com/edenhill/librdkafka.git && \
    cd librdkafka && \
    ./configure && \
    make && \
    make install && \
    ldconfig && \
    go get -u -v github.com/confluentinc/confluent-kafka-go/kafka

