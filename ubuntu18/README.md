## building the image
```
docker build . -t build-ceph-on-ubuntu18
```

## building ceph inside the image
- clone the ceph repo (e.g. ``git clone https://github.com/ceph/ceph.git /path/to/ceph``)
- run ``do_cmake.sh`` inside the ceph directory
- build ceph inside the container
```
docker run --mount type=bind,src=/path/to/ceph,dst=/ceph --mount type=volume,src=ceph-build-vol-ubuntu18,dst=/ceph/build build-ceph-on-ubuntu18
```
- note that the ``build`` directories inside and outside the container are different
- source code is the same, and can only be modified from outside the container
- the ``build`` directory inside the container is persistent, so the incremental builds are possible

## executing a binary built in the container
For example, to run one of the unit tests use:
```
docker run --mount type=bind,src=/path/to/ceph,dst=/ceph --mount type=volume,src=ceph-build-vol-ubuntu18,dst=/ceph/build build-ceph-on-ubuntu18 /ceph/build/bin/unittest_rgw_amqp
```

