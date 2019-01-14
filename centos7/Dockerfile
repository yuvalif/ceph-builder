FROM centos:7

RUN yum -y install bc

ADD https://raw.githubusercontent.com/ceph/ceph/master/install-deps.sh /install-deps.sh
ADD https://raw.githubusercontent.com/ceph/ceph/master/ceph.spec.in /ceph.spec.in
RUN bash /install-deps.sh
RUN mkdir ceph
COPY ./entrypoint.sh /
ENTRYPOINT [ "bash", "/entrypoint.sh" ]

