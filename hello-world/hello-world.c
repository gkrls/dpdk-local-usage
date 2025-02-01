#include <rte_eal.h>
#include <rte_lcore.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    if (rte_eal_init(argc, argv) < 0) {
        rte_exit(EXIT_FAILURE, "EAL initialization failed\n");
    }

    unsigned lcore_id;
    RTE_LCORE_FOREACH_WORKER(lcore_id) {
        printf("Hello, World! from lcore %u\n", lcore_id);
    }

    rte_eal_cleanup();
    return 0;
}