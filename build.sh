#!/bin/bash

sudo apt update
sudo apt install build-essential -y
sudo apt-get install libncurses-dev -y

apt-get -y install flex bison libelf-dev libssl-dev xorriso autoconf libtool python3-venv

TOP=$HOME/minilinux
mkdir $TOP

#cd $TOP
#curl https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.6.32.tar.xz | tar xJf -
#curl https://busybox.net/downloads/busybox-1.36.1.tar.bz2 | tar xjf -


#cd $TOP/busybox-1.36.1
#mkdir -pv ../obj/busybox-x86
#make O=../obj/busybox-x86 defconfig
