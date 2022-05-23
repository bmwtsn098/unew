FROM golang:1.18

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential

ADD . /unew
WORKDIR /unew

#ENV GOPATH=$GOPATH:/unew/
RUN go mod init unew
RUN go build