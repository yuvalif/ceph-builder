# ceph-builder
Docker files for building the [ceph](https://github.com/ceph/ceph) project under different OSs and version.

> Before you start please install `podman` (e.g. `sudo dnf install podman`)

- To build all images use: `make image`
- To build ceph inside these images use `make build`. Please set the `CEPH_DIR` env variable to point to where the ceph code tree
- To build a specific target, run the above commands inside the target's directory
- To build the images and ceph manually use the following commands from inside the different subdirectories:

## building the image
```
podman build . -t <image name>
```

## building ceph inside the image
- clone the ceph repo (e.g. ``git clone https://github.com/ceph/ceph.git /path/to/ceph``)
- run ``do_cmake.sh`` inside the ceph directory
- build ceph inside the container
```
podman run --rm --privileged --mount type=bind,src=/path/to/ceph,dst=/ceph --mount type=volume,src=<volume name>,dst=/ceph/build <image name>
```
> notes:
> - that the ``build`` directories inside and outside the container are different
> - source code is the same, and can only be modified from outside the container
> - the ``build`` directory inside the container is persistent, so the incremental builds are possible
> - use different volume names for each image

## executing a binary built in the container
For example, to run one of the unit tests use:
```
podman run --rm --privileged --mount type=bind,src=/path/to/ceph,dst=/ceph --mount type=volume,src=<volume name>,dst=/ceph/build <image name> /ceph/build/bin/unittest_rgw_amqp
```

