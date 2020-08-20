# Based on the Fedora image
FROM fedora:32

RUN dnf -y install bc
#RUN dnf -y install dnf-plugins-core
# another, more updated, install-deps.sh will be invoked in runtime for updating dependencies
COPY ./install-deps.sh /install-deps.sh
COPY ./ceph.spec.in /ceph.spec.in
RUN /install-deps.sh
#RUN dnf -y install python2-devel
#RUN dnf -y install python2-Cython
COPY ./entrypoint.sh /entrypoint.sh
RUN rm -f ceph.spec.in
RUN rm -f install-deps.sh

# build ceph
CMD ["./entrypoint.sh"]

