FROM golang:1.22

WORKDIR /sprint12

COPY go.mod go.sum ./

RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /my_app -gcflags "all=-N -l"

COPY tracker.db ./

CMD ["/my_app"]