# builder image
FROM golang:1.18.2-alpine3.15 AS builder

RUN mkdir /app

COPY ./app/riders-api/ /app/
COPY go.mod /app/

WORKDIR /app
RUN go mod tidy
RUN CGO_ENABLED=0 GOOS=linux go build -a -o riders-api .

# Generate clean build
FROM alpine:3.15.4
COPY --from=builder /app/riders-api .
EXPOSE 3000

ENTRYPOINT [ "./riders-api" ]