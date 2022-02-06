#!/bin/bash

#This script must be run in upper ubuntu iso director

verno=$1

IMAGE=Ubuntu18.04-SFCOS-V$verno.iso
BUILD=$PWD/ubuntu-image/

echo "SFCOS-V$verno" > $PWD/ubuntu-image/overfs/etc/SFCOS-release

mkisofs -r -V "SFCOS-V$verno" \
            -cache-inodes \
            -J -l -b isolinux/isolinux.bin \
            -c isolinux/boot.cat -no-emul-boot \
            -boot-load-size 4 -boot-info-table \
            -o $IMAGE $BUILD
