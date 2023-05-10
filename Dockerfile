FROM golang:1.20-alpine

ARG TARGETOS
ARG TARGETARCH

LABEL maintainer="Bo-Yi Wu <appleboy.tw@gmail.com>"

# RUN apk add ca-certificates
# WORKDIR /app
# # Force the go compiler to use modules
# ENV GO111MODULE=on
# # We want to populate the module cache based on the go.{mod,sum} files.
# COPY go.mod .
# COPY go.sum .
# COPY main.go .

# ENV GOOS=${TARGETOS}
# ENV GOARCH=${TARGETARCH}
# RUN go build -o /app -tags netgo -ldflags '-w -extldflags "-static"' .

CMD ["/app"]
