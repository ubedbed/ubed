FROM ubuntu:14.04
MAINTAINER ubed <ubedcoy@online.sch.id>

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository ppa:nviennot/tmate \
    && apt-get update \
    && apt-get install -y openssh-client tmate\
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

ADD build.sh /root/build.sh

EXPOSE 8080
WORKDIR /root

ENTRYPOINT ["/root/build.sh"]
