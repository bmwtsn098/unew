# Build Stage:
FROM golang:1.18 as builder

# Install Build Dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential

# Add Source Code
ADD . /unew
WORKDIR /unew

# Build Step
RUN go mod init unew
RUN go build

# Package Stage
FROM debian:bookworm-slim
COPY --from=builder /unew/unew /