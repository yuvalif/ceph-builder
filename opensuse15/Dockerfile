# Based on the Opensuse image
FROM opensuse/leap

# another, more updated, install-deps.sh will be invoked in runtime for updating dependencies
COPY ./install-deps.sh /install-deps.sh
COPY ./ceph.spec.in /ceph.spec.in
RUN zypper -n install git
RUN /install-deps.sh
RUN zypper -n install python2-devel
RUN zypper -n install python2-Cython
COPY ./entrypoint.sh /entrypoint.sh
RUN rm -f ceph.spec.in
RUN rm -f install-deps.sh

# build ceph
CMD ["./entrypoint.sh"]

