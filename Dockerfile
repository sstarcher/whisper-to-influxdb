FROM golang:1.4

ENV APP_NAME whisper-to-influxdb
RUN mkdir -p /go/src/$APP_NAME
WORKDIR /go/src/$APP_NAME
COPY . .

RUN go get || true
WORKDIR /go/src/github.com/influxdb/influxdb/
RUN git checkout v0.8.8
WORKDIR /go/src/$APP_NAME
RUN go install

VOLUME /opt/graphite/storage/whisper/

ENTRYPOINT /go/bin/whisper-to-influxdb
