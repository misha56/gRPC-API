FROM golang:1.20.3-alpine3.17 AS builder

WORKDIR /build/

COPY . .

RUN go mod download

RUN go build -o ./grpc cmd/main.go

RUN go install github.com/golang-migrate/migrate/v4/cmd/migrate@v4.15.2

FROM scratch

WORKDIR /grpc-api
ENV PATH=/grpc-api/bin/:$PATH

COPY --from=builder /build/grpc ./bin/grpc
COPY --from=builder /go/bin/migrate ./bin/migrate
COPY --from=builder /build/db/ .

EXPOSE 3000

CMD ["grpc"]