FROM golang:1.13.6-alpine

RUN apk update && apk upgrade && apk add --no-cache git

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY render/api render/api
COPY glitch glitch

RUN GO111MODULE=on go build glitch/main.go

EXPOSE 8085

CMD ["./main"]
