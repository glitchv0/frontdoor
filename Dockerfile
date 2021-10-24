FROM golang:alpine as builder
WORKDIR /src/

COPY frontdoor.go go.mod /src/

RUN CGO_ENABLED=0 go build -o /go/bin/frontdoor .
FROM scratch

COPY --from=builder /go/bin/frontdoor /go/bin/frontdoor
EXPOSE 8000
ENV varFromEnv ${varFromEnv:-varFromEnv was notNotSet}
ENTRYPOINT ["/go/bin/frontdoor"]