FROM golang@sha256:5519c8752f6b53fc8818dc46e9fda628c99c4e8fd2d2f1df71e1f184e71f47dc as builder
WORKDIR /src/
RUN addgroup -S scratchgroup && adduser -S scratchuser -G scratchgroup
COPY frontdoor.go go.mod /src/

RUN CGO_ENABLED=0 go build -o /go/bin/frontdoor .
FROM scratch

COPY --from=builder /go/bin/frontdoor /go/bin/frontdoor
COPY --from=builder /etc/passwd /etc/passwd
USER scratchuser
EXPOSE 8000
ENV varFromEnv ${varFromEnv:-varFromEnv was notNotSet}
ENTRYPOINT ["/go/bin/frontdoor"]