FROM golang as build

WORKDIR /app

COPY . .

RUN GOOS=linux GOARCH=amd64 go build -o app .

FROM scratch

COPY --from=build app/app .

CMD ["./app"]
