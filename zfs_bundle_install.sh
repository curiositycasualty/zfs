#!/bin/bash

#Clearly needs to be integrated into autotools process, but just a hack for now.

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    sudo "$0" "$@"
    exit
fi
sudo rm -rf /System/Library/Filesystems/zfs.fs
sudo cp -R zfs_bundle/zfs.fs /System/Library/Filesystems/
sudo make install
sudo ln -s /System/Library/Filesystems/zfs.fs/Contents/Resources/mount_zfs /sbin/mount_zfs
cd ../spl
sudo make install