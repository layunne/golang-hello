FROM golang as build

WORKDIR /app

COPY . .

RUN go build -o app .

FROM alpine:3.7

RUN apk update && \
    apk add ca-certificates && \
    rm -rf /var/cache/apk/*

COPY --from=build app/app .

CMD ["./app"]
