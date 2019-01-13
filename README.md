# ceph-builder
Docker files for building the ceph project under different OS version.

# Creating the Images
Inside the ```ubuntu-xenial``` directory, create the builder image using:
```
docker build -t yuvalif/ceph_ubuntu_xenial_builder .
```

# Using the Images
Inside the top dir for Ceph, run:
```
docker run --rm -v /home/ylifshit/projects/ceph:/ceph -it yuvalif/ceph_ubuntu_xenial_builder
```

