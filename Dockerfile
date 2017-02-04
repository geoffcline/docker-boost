FROM ubuntu:trusty
MAINTAINER Kuo-Cheng Yeu <kmd@mikuru.tw>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update \
&& apt-get -qqy install \
    libboost-all-dev \
    g++ \
    vim \
    make \
&& rm -rf /var/lib/apt/lists/*

# build cmake
RUN         curl -O http://www.cmake.org/files/v3.0/cmake-3.0.2.tar.gz \
                && tar -xvf cmake-3.0.2.tar.gz
WORKDIR     cmake-3.0.2
RUN         ./bootstrap \
                && make \
                && make install

ENTRYPOINT /bin/bash

