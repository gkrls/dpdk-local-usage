DPDK_VERSION=24.11.1

######################################
DPDK_ARCHIVE=dpdk-$DPDK_VERSION.tar.xz

wget https://fast.dpdk.org/rel/$DPDK_ARCHIVE

DPDK_DIR=$(pwd)/dpdk
DPDK_BUILD_DIR=$DPDK_DIR/build
DPDK_INSTALL_DIR=$DPDK_DIR/install

rm -rf $DPDK_DIR
tar -xf $DPDK_ARCHIVE --one-top-level=$DPDK_DIR --strip-components=1

meson setup $DPDK_BUILD_DIR $DPDK_DIR --prefix=$DPDK_INSTALL_DIR
ninja -C $DPDK_BUILD_DIR
meson install -C $DPDK_BUILD_DIR

rm -f $DPDK_ARCHIVE