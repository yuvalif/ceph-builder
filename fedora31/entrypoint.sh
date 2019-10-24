#!/bin/bash

cd ceph || exit
echo "******************************************"
echo "Calling updated version of install-deps.sh"
echo "******************************************"
./install-deps.sh || exit
mkdir -p build
cd build || exit
cmake -DWITH_MGR_DASHBOARD_FRONTEND=OFF -DWITH_SPDK=OFF -DWITH_DPDK=OFF -DWITH_CEPHFS=OFF -DWITH_CCACHE=OFF -DALLOCATOR=libc -DCMAKE_BUILD_TYPE=Debug ..
make -j "$(nproc)"
