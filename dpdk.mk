DPDK_MK_PATH := $(realpath $(lastword $(MAKEFILE_LIST)))
DPDK_INSTALL := $(dir $(DPDK_MK_PATH))dpdk/install
DPDK_INCLUDE := $(DPDK_INSTALL)/include
DPDK_LIB := $(DPDK_INSTALL)/lib/x86_64-linux-gnu
DPDK_PKG_CONFIG_PATH := $(DPDK_LIB)/pkgconfig
DPDK_PKG_CONFIG_FILE := $(shell PKG_CONFIG_PATH=$(DPDK_PKG_CONFIG_PATH) pkg-config --variable=pcfiledir libdpdk)
DPDK_CFLAGS := $(shell PKG_CONFIG_PATH=$(DPDK_PKG_CONFIG_PATH) pkg-config --cflags libdpdk)
DPDK_LDFLAGS_SHARED := $(shell PKG_CONFIG_PATH=$(DPDK_PKG_CONFIG_PATH) pkg-config --libs libdpdk)
DPDK_LDFLAGS_STATIC := $(shell PKG_CONFIG_PATH=$(DPDK_PKG_CONFIG_PATH) pkg-config --static --libs libdpdk)