include ../dpdk.mk

APP=hello-world

CFLAGS += -O3 $(DPDK_CFLAGS)

SRCS =hello-world.c
BINS = $(APP)-shared $(APP)-static

# if no system-wide installation we need to run the program with
# LD_LIBRARY_PATH=/path/to/dpdk/lib:$LD_LIBRARY_PATH ./app-shared
$(APP)-shared: $(SRCS-y) Makefile $(DPDK_PKG_CONFIG_FILE)
	$(CC) $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS) $(DPDK_LDFLAGS_SHARED)
	$(shell echo "LD_LIBRARY_PATH=$(DPDK_LIB):$(DPDK_LIB)/dpdk:$$LD_LIBRARY_PATH ./hello-world-shared" > $(APP)-shared.sh)
	$(shell chmod +x $(APP)-shared.sh)

$(APP)-static: $(SRCS-y) Makefile $(PC_FILE)
	$(CC) $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS) $(DPDK_LDFLAGS_STATIC)

clean:
	rm -f $(BINS)