# Based on the Fedora image
FROM ubuntu:18.04

RUN apt-get -y update
# another, more updated, install-deps.sh will be invoked in runtime for updating dependencies
COPY ./install-deps.sh /install-deps.sh
RUN mkdir -p debian
COPY ./control /debian
RUN /install-deps.sh
RUN rm -rf debian
RUN rm -f install-deps.sh
RUN apt-get -y autoremove

COPY ./entrypoint.sh /entrypoint.sh

# build ceph
CMD ["./entrypoint.sh"]

