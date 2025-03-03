#!/bin/bash

git clone https://github.com/qemu/qemu.git

cd qemu

git checkout tags/v9.1.1

mkdir build
cd build
../configure --target-list="x86_64-softmmu" --disable-xen --disable-bsd-user --disable-guest-agent --disable-strip --disable-werror --disable-gcrypt --disable-debug-info --disable-debug-tcg --disable-docs --disable-tcg-interpreter --enable-attr --disable-brlapi --disable-linux-aio --disable-bzip2 --disable-cap-ng --disable-curl --disable-fdt --disable-glusterfs --disable-gnutls --disable-nettle --disable-gtk --disable-rdma --disable-libiscsi --disable-vnc-jpeg --disable-lzo --disable-curses --disable-libnfs --disable-numa --disable-opengl --disable-rbd --disable-vnc-sasl --disable-sdl --disable-seccomp --disable-smartcard --disable-snappy --disable-spice --disable-libusb --disable-usb-redir --disable-vde --disable-vhost-net --disable-virglrenderer --disable-virtfs --disable-vnc --disable-vte --disable-xen --disable-xen-pci-passthrough --enable-linux-user --disable-system --disable-tools --static --disable-pie
../configure --target-list=x86_64-softmmu --disable-xen --disable-bsd-user --disable-debug-info --disable-debug-tcg --disable-docs --disable-glusterfs --disable-gnutls --disable-smartcard --disable-tools --disable-virtfs
../configure --target-list=x86_64-softmmu --without-default-features --without-default-devices
make -j8

