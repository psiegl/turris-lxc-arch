#!/bin/sh
mkdir -p ${LXC_ROOTFS_MOUNT}/sys/fs/cgroup/systemd
mount cgroup ${LXC_ROOTFS_MOUNT}/sys/fs/cgroup/systemd \
  -t cgroup \
  -o rw,nosuid,nodev,noexec,relatime,xattr,name=systemd
