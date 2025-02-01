#!/bin/bash

HUGEPAGES_DIR="/mnt/huge"
HUGEPAGES_NUM=1024
HUGEPAGES_SIZE=2048

enable_hugepages() {
    echo "Enabling hugepages..."
    echo $HUGEPAGES_NUM | sudo tee /sys/kernel/mm/hugepages/hugepages-${HUGEPAGES_SIZE}kB/nr_hugepages > /dev/null
    sudo mkdir -p $HUGEPAGES_DIR
    sudo mount -t hugetlbfs nodev $HUGEPAGES_DIR
    echo "Hugepages enabled."
}

disable_hugepages() {
    echo "Disabling hugepages..."
    sudo umount $HUGEPAGES_DIR
    sudo rmdir $HUGEPAGES_DIR
    echo 0 | sudo tee /sys/kernel/mm/hugepages/hugepages-${HUGEPAGES_SIZE}kB/nr_hugepages > /dev/null
    echo "Hugepages disabled."
}

check_hugepages() {
    if grep -q "nodev $HUGEPAGES_DIR" /proc/mounts; then
        echo "Hugepages are currently enabled."
        return 0
    else
        echo "Hugepages are currently disabled."
        return 1
    fi
}

if [ "$1" == "enable" ]; then
    if check_hugepages; then
        echo "Hugepages are already enabled. No action needed."
    else
        enable_hugepages
    fi
elif [ "$1" == "disable" ]; then
    if check_hugepages; then
        disable_hugepages
    else
        echo "Hugepages are already disabled. No action needed."
    fi
elif [ "$1" == "check" ]; then
  check_hugepages
else
    echo "Usage: $0 {enable|disable|check}"
    exit 1
fi