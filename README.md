## DPDK usage without global system installation

1. Run `dpdk.sh` to download build and install DPDK locally (under `$PWD`). This script will download DPDK into the `dpdk` directory, build it into the `dpdk/build` directory and install it into the `dpdk/install` directory.
    - The script is configured to download version `24.11.1` (latest version at the time of writting). For a different version please change the script's `DPDK_VERSION` variable.

2. Use `hello-world/Makefile` as a template for building DPDK apps with static or shared linkage
3. Before running the program make sure you enable hugepages with `sudo ./hugepages.sh enable`.
    - You can disable hugepages with `sudo ./hugepages.sh disable` or check the status with `sudo ./hugepages.sh check`
4. Run the DPDK application with sudo
    - With static linkage the app can be run as is: `sudo ./hello-world-static`
    - With dynamic linkage the app needs to be run with `LD_LIBRARY_PATH=/path/to/dpdk/shared/lib`. For this reason, the Makefile also generates a helper script. We can instead do: `sudo ./hello-world-shared.sh`
    - Running hello-world should output something like this:
      ```
      EAL: Detected CPU lcores: 32
      EAL: Detected NUMA nodes: 1
      EAL: Detected shared linkage of DPDK
      EAL: Multi-process socket /var/run/dpdk/rte/mp_socket
      EAL: Selected IOVA mode 'VA'
      Hello, World! from lcore 1
      Hello, World! from lcore 2
      Hello, World! from lcore 3
      ...

**TODO**: cmake integration