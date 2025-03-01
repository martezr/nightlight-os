#!/bin/bash

curl https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.12.3.tar.xz | tar xJf -
cd linux-6.12.3
make ARCH=x86 tinyconfig
#make -j 2
