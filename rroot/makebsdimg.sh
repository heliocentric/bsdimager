#!/bin/sh

PWD=`pwd`

cd ${PWD}/boot
makefs root.fs /nroot
gzip -9nc root.fs >root.fs.gz
rm root.fs
mkdir -p /usr/tftpboot/boot
cp -r * /usr/tftpboot/boot
cd /
VERSION=$(cat /nroot/etc/rc | grep "VERSION=" | cut -d = -f 2)
mkisofs -b boot/cdboot -no-emul-boot -r -J -V "BSDImager-${VERSION}" -publisher "Dylan Cochran" -o bsdimager.iso /rroot/
