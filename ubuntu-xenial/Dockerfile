FROM ubuntu:16.04

RUN apt-get update && apt-get -y install libudev-dev
RUN apt-get -y install \
    libblkid-dev \
    libsnappy-dev \
    libcurl4-openssl-dev \
    libexpat-dev \
    git \
    cmake \
    python3-sphinx \
    libxmlsec1 \
    libxmlsec1-nss \
    libxmlsec1-openssl \
    libxmlsec1-dev \
    liboath-dev \
    python \
    cython \
    libpython-dev \
    gperf

# upgrade gcc to 7
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get update
RUN apt-get -y install g++-7
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 --slave /usr/bin/g++ g++ /usr/bin/g++-7 
RUN update-alternatives --config gcc

RUN mkdir ceph
# the above dependencies match the do_cmake.sh call from entrypoint.sh below
COPY ./entrypoint.sh /
ENTRYPOINT [ "bash", "/entrypoint.sh" ]

