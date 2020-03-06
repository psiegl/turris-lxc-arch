#!/bin/sh

mkdir ${LXC_ROOTFS_MOUNT}/dev/net
mknod -m 666 ${LXC_ROOTFS_MOUNT}/dev/net/tun c 10 200

# Passthrough Marvell mv_cesa crypto
# https://forum.turris.cz/t/passthrough-marvell-mv-cesa-crypto-device-into-lxc-container/4884
mknod -m 666 ${LXC_ROOTFS_MOUNT}/dev/crypto c 10 58

mknod -m 666 ${LXC_ROOTFS_MOUNT}/dev/md0 b 9 0   # /dev/md0
mkdir -p ${LXC_ROOTFS_MOUNT}/raid
mount ${LXC_ROOTFS_MOUNT}/dev/md0 ${LXC_ROOTFS_MOUNT}/raid -o rw,noatime,nodiratime

mknod -m 666 ${LXC_ROOTFS_MOUNT}/dev/md127 b 9 127   # /dev/md127
mkdir -p ${LXC_ROOTFS_MOUNT}/raid1
mount ${LXC_ROOTFS_MOUNT}/dev/md127 ${LXC_ROOTFS_MOUNT}/raid1 -o rw,noatime,nodiratime

mkdir -p ${LXC_ROOTFS_MOUNT}/srv/nfs/share
mount --bind ${LXC_ROOTFS_MOUNT}/raid/share ${LXC_ROOTFS_MOUNT}/srv/nfs/share


mkdir -p ${LXC_ROOTFS_MOUNT}/home/sync/share
mount --bind ${LXC_ROOTFS_MOUNT}/raid/share ${LXC_ROOTFS_MOUNT}/home/sync/share

echo "nameserver 192.168.178.1" > ${LXC_ROOTFS_MOUNT}/etc/resolv.conf
