#!/bin/bash

cd ceph || exit
echo "******************************************"
echo "Calling updated version of install-deps.sh"
echo "******************************************"
./install-deps.sh || exit
mkdir -p build
cd build || exit
cp /build.sh /ceph/build/
scl enable devtoolset-7 /ceph/build/build.sh
