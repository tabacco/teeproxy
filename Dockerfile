FROM golang:latest AS builder
WORKDIR /go/src/teeproxy
COPY teeproxy.go ./
RUN go build -o teeproxy

FROM alpine:3.5 AS runner
COPY --from=builder /go/src/teeproxy/teeproxy /usr/local/bin
ENTRYPOINT ["/usr/local/bin/teeproxy"]
