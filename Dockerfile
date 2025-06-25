FROM golang:tip-bookworm

ARG UID='1000'
ARG HUGO_HOME='/src'

RUN apt-get update --yes && apt-get install --yes wget git curl jq gcc && \
    hugo_version="$(curl https://api.github.com/repos/gohugoio/hugo/releases/latest -s | jq .name -r | cut -c2-)" && \
    useradd --system --uid $UID --home-dir $HUGO_HOME hugo && \
    mkdir /hugo-src && \
    cd /hugo-src && \
    wget https://github.com/gohugoio/hugo/archive/refs/tags/v$hugo_version.tar.gz && \
    tar -xvf v$hugo_version.tar.gz && \
    cd hugo-$hugo_version && \
    CGO_ENABLED=1 go install --tags extended

ENV PATH "${PATH}:/root/go/bin"

WORKDIR /src
EXPOSE 1313
