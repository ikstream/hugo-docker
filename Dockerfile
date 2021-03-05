FROM docker.io/library/debian:sid-20210208-slim
ARG HUGO_VERSION='0.80.0'

RUN apt-get update && \
    apt-get install wget golang-go -y && \
    adduser --system --uid 1000 --home /src hugo && \
    mkdir /hugo-src && \
    cd  /hugo-src && \
    wget https://github.com/gohugoio/hugo/archive/v$HUGO_VERSION.tar.gz && \
    tar -xvf v$HUGO_VERSION.tar.gz && \
    cd hugo-$HUGO_VERSION && \
    go install

WORKDIR /src
EXPOSE 1313
