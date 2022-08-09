## building the image
```
podman build . -t build-ceph-on-fedora36
```

## building ceph inside the image
- clone the ceph repo (e.g. ``git clone https://github.com/ceph/ceph.git /path/to/ceph``)
- run ``do_cmake.sh`` inside the ceph directory
- build ceph inside the container
```
podman run --mount type=bind,src=/path/to/ceph,dst=/ceph --mount type=volume,src=ceph-build-vol-fedora36,dst=/ceph/build build-ceph-on-fedora36
```
- note that the ``build`` directories inside and outside the container are different
- source code is the same, and can only be modified from outside the container
- the ``build`` directory inside the container is persistent, so the incremental builds are possible

## executing a binary built in the container
For example, to run one of the unit tests use:
```
podman run --mount type=bind,src=/path/to/ceph,dst=/ceph --mount type=volume,src=ceph-build-vol-fedora36,dst=/ceph/build build-ceph-on-fedora36 /ceph/build/bin/unittest_rgw_amqp
```

