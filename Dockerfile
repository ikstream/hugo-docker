FROM debian:sid-20210111-slim

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y hugo && \
    adduser --system --uid 1000 --home /src hugo

WORKDIR /src
EXPOSE 1313
