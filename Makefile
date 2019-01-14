all: ubuntu-xenial ubuntu-bionic centos7

ubuntu-xenial:
	cd $@ && docker build -t yuvalif/ceph-$@-builder .


ubuntu-bionic:
	cd $@ && docker build -t yuvalif/ceph-$@-builder .

centos7:
	cd $@ && docker build -t yuvalif/ceph-$@-builder .

.PHONY: ubuntu-xenial ubuntu-bionic centos7

