#!/bin/bash

cd ceph || exit
echo "******************************************"
echo "Calling updated version of install-deps.sh"
echo "******************************************"
./install-deps.sh || exit
mkdir -p build
cd build || exit
cmake -DBOOST_J=$(nproc) -GNinja -DCMAKE_CXX_COMPILER=g++ .. || exit
ninja
