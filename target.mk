IMAGE_NAME = build-ceph-on-$(notdir $(CURDIR))
VOLUME_NAME = ceph-build-vol-$(notdir $(CURDIR))

all:

deb-image:
	wget --quiet --output-document install-deps.sh https://raw.githubusercontent.com/ceph/ceph/master/install-deps.sh
	chmod +x install-deps.sh
	wget --quiet --output-document control https://raw.githubusercontent.com/ceph/ceph/master/debian/control
	podman build . -t $(IMAGE_NAME)

rpm-image:
	wget --quiet --output-document install-deps.sh https://raw.githubusercontent.com/ceph/ceph/master/install-deps.sh
	chmod +x install-deps.sh
	wget --quiet --output-document ceph.spec.in https://raw.githubusercontent.com/ceph/ceph/master/ceph.spec.in
	podman build . -t $(IMAGE_NAME)

build:
	podman run --rm --privileged --mount type=bind,src=$(CEPH_DIR),dst=/ceph,bind-nonrecursive --mount type=volume,src=$(VOLUME_NAME),dst=/ceph/build $(IMAGE_NAME)

clean:
	podman run --rm --privileged --mount type=bind,src=$(CEPH_DIR),dst=/ceph,bind-nonrecursive --mount type=volume,src=$(VOLUME_NAME),dst=/ceph/build $(IMAGE_NAME) rm -rf /ceph/build/*
