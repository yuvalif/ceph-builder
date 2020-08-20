# Based on the Fedora image
FROM centos:7

RUN yum -y install bc
# another, more updated, install-deps.sh will be invoked in runtime for updating dependencies
COPY ./install-deps.sh /install-deps.sh
COPY ./ceph.spec.in /ceph.spec.in
RUN /install-deps.sh
RUN yum -y install centos-release-scl
RUN yum -y install devtoolset-7
RUN yum -y install cmake3
RUN ln -s /usr/bin/cmake3 /usr/bin/cmake
COPY ./entrypoint.sh /entrypoint.sh
COPY ./build.sh /build.sh
RUN rm -f ceph.spec.in
RUN rm -f install-deps.sh

# build ceph
CMD ["./entrypoint.sh"]

