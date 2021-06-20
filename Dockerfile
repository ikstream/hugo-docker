FROM golang:1.16.4-alpine3.13

ARG UID='1000'
ARG HUGO_HOME='/src'

RUN apk update && apk add wget git shadow curl jq && \
    hugo_version="$(curl https://api.github.com/repos/gohugoio/hugo/releases/latest -s | jq .name -r | cut -c2-)" && \
    useradd --system --uid $UID --home-dir $HUGO_HOME hugo && \
    mkdir /hugo-src && \
    cd /hugo-src && \
    wget https://github.com/gohugoio/hugo/archive/v$hugo_version.tar.gz && \
    tar -xvf v$hugo_version.tar.gz && \
    cd hugo-$hugo_version && \
    go install

ENV PATH "${PATH}:/root/go/bin"


WORKDIR /src
EXPOSE 1313
