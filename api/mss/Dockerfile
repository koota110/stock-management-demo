FROM golang:1.14.4 AS builder
COPY ./ ./src/github.com/koota110/stock-management-demo/api
WORKDIR ${GOPATH}/src/github.com/koota110/stock-management-demo/api/mss/api
RUN env CGO_ENABLED=0 go build -o /tmp/mss-api cmd/main.go

FROM gcr.io/distroless/static
COPY --from=builder /tmp/mss-api /
COPY --from=builder /go/src/github.com/egxp/let-suite/api/mss/api/authorityMatrix.yml /
CMD ["/mss-api"]
