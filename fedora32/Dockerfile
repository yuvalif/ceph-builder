# Based on the Fedora image
FROM fedora:32

RUN dnf -y install bc
RUN dnf -y install git
# another, more updated, install-deps.sh will be invoked in runtime for updating dependencies
COPY ./install-deps.sh /install-deps.sh
COPY ./ceph.spec.in /ceph.spec.in
RUN /install-deps.sh
COPY ./entrypoint.sh /entrypoint.sh
RUN rm -f ceph.spec.in
RUN rm -f install-deps.sh

# build ceph
CMD ["./entrypoint.sh"]

