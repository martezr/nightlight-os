#!/bin/bash

rm -Rf /vagrant/iso/boot
mkdir -p /vagrant/iso/boot/grub

cp /vagrant/bzImage /vagrant/iso/boot
cp /vagrant/initramfs.cpio.gz /vagrant/iso/boot

cat << EOF > /vagrant/iso/boot/grub/grub.cfg
set default=0
set timeout=5
menuentry "nightlight router" {
    insmod gzio
    insmod part_msdos
    linux /boot/bzImage
    initrd /boot/initramfs.cpio.gz
}
EOF

grub-mkrescue -o /vagrant/nightlight-router.iso /vagrant/iso/
