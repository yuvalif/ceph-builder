# Based on the Fedora image
FROM fedora:36

# another, more updated, install-deps.sh will be invoked in runtime for updating dependencies
COPY ./install-deps.sh /install-deps.sh
COPY ./ceph.spec.in /ceph.spec.in
RUN /install-deps.sh
COPY ./entrypoint.sh /entrypoint.sh
RUN rm -f ceph.spec.in
RUN rm -f install-deps.sh
# some missing packages to install manually
RUN dnf -y install git
RUN dnf -y install jq
RUN dnf -y install npm

# build ceph
CMD ["./entrypoint.sh"]

