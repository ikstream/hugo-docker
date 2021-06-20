FROM golang:1.16.4-alpine3.13

ARG HUGO_VERSION=$(curl https://api.github.com/repos/gohugoio/hugo/releases/latest -s | jq .name -r)
ARG UID='1000'
ARG HUGO_HOME='/src'

RUN apk update && apk add wget git shadow && \
    useradd --system --uid $UID --home-dir $HUGO_HOME hugo && \
    mkdir /hugo-src && \
    cd /hugo-src && \
    wget https://github.com/gohugoio/hugo/archive/$HUGO_VERSION.tar.gz && \
    tar -xvf $HUGO_VERSION.tar.gz && \
    cd hugo-$HUGO_VERSION && \
    go install

ENV PATH "${PATH}:/root/go/bin"


WORKDIR /src
EXPOSE 1313
