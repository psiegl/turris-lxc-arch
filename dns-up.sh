#!/bin/sh
set -e
echo "nameserver 192.168.178.1" > ${LXC_ROOTFS_PATH}/etc/resolv.conf
