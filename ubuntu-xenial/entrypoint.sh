cd ceph
git submodule update --init --recursive
rm -rf build
./do_cmake.sh \
    -D WITH_CCACHE=OFF \
    -D CMAKE_BUILD_TYPE=Debug \
    -D CMAKE_CXX_FLAGS_DEBUG="$CXX_FLAGS_DEBUG" \
    -D CMAKE_C_FLAGS_DEBUG="$C_FLAGS_DEBUG" \
    -D ENABLE_GIT_VERSION=OFF \
    -D WITH_SYSTEM_BOOST=OFF \
    -D WITH_SYSTEM_NPM=OFF \
    -D WITH_LTTNG=OFF \
    -D WITH_BABELTRACE=OFF \
    -D WITH_SEASTAR=OFF \
    -D WITH_FUSE=OFF\
    -D WITH_KRBD=OFF \
    -D WITH_XFS=OFF \
    -D WITH_KVS=ON \
    -D CEPH_MAN_DIR=man \
    -D WITH_LIBCEPHFS=OFF \
    -D WITH_CEPHFS=OFF \
    -D WITH_MGR=OFF \
    -D WITH_RDMA=OFF \
    -D WITH_SPDK=OFF \
    -D WITH_OPENLDAP=OFF \
    -D WITH_GSSAPI=OFF \
    -D WITH_LEVELDB=OFF \
    -D WITH_BLUESTORE=OFF \
    -D WITH_LZ4=OFF

cd build && make -j 4