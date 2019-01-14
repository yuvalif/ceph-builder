FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install libudev-dev
RUN apt-get -y install \
    libblkid-dev \ 
    libsnappy-dev  \
    libcurl4-openssl-dev \
    libexpat-dev \
    git \
    cmake \
    g++ \
    python3-sphinx \
    libxmlsec1 \
    libxmlsec1-nss \
    libxmlsec1-openssl \
    libxmlsec1-dev \
    liboath-dev \
    python \
    cython \
    libpython-dev \
    gperf \ 
    librabbitmq-dev

RUN mkdir ceph
# the above dependencies match the do_cmake.sh call from entrypoint.sh below
COPY ./entrypoint.sh /
ENTRYPOINT [ "bash", "/entrypoint.sh" ]

