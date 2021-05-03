FROM archlinux:base-devel-20210425.0.20608

ARG HUGO_VERSION='0.83.1'
ARG UID='1000'
ARG HUGO_HOME='/src'

RUN pacman -Sy --noconfirm wget git go && \
    useradd --system --uid $UID --home-dir $HUGO_HOME hugo && \
    mkdir /hugo-src && \
    cd /hugo-src && \
    wget https://github.com/gohugoio/hugo/archive/v$HUGO_VERSION.tar.gz && \
    tar -xvf v$HUGO_VERSION.tar.gz && \
    cd hugo-$HUGO_VERSION && \
    go install

ENV PATH "${PATH}:/root/go/bin"


WORKDIR /src
EXPOSE 1313
