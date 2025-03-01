#!/bin/bash

cp /vagrant/binaries/* ./initramfs/bin

cd initramfs
find . -print0 | cpio --null -ov --format=newc | gzip -9 > ../initramfs.cpio.gz
cd ..

mv initramfs.cpio.gz /vagrant
