#!/bin/bash
if [ ! -d /root/linux-6.6.32 ]; then
  echo "Directory does exists."
  curl https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.6.32.tar.xz | tar xJf -
fi

cd /root/linux-6.6.32
cp /vagrant/configs/kernel/router.config .config
make ARCH=x86 -j 6
cp /root/linux-6.6.32/arch/x86/boot/bzImage /vagrant