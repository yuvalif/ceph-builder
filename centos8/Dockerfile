# Based on the Fedora image
FROM centos:8

RUN yum -y install bc
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN yum -y install https://rpms.remirepo.net/enterprise/remi-release-8.rpm
RUN yum -y install http://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/x/xmlstarlet-1.6.1-1.el7.x86_64.rpm
RUN yum -y install http://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/l/libbabeltrace-1.2.4-3.el7.x86_64.rpm
RUN yum -y install http://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/l/libbabeltrace-devel-1.2.4-3.el7.x86_64.rpm
RUN yum -y install yum-utils
RUN yum-config-manager --enable AppStream
RUN yum-config-manager --enable PowerTools
# another, more updated, install-deps.sh will be invoked in runtime for updating dependencies
COPY ./install-deps.sh /install-deps.sh
COPY ./ceph.spec.in /ceph.spec.in
RUN /install-deps.sh
COPY ./entrypoint.sh /entrypoint.sh

# build ceph
CMD ["./entrypoint.sh"]

