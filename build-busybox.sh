#!/bin/bash

if [ ! -d /root/busybox-1.36.1 ]; then
  echo "Directory does not exists."
  curl https://busybox.net/downloads/busybox-1.36.1.tar.bz2 | tar xjf -
fi

rm -Rf /root/initramfs

cd /root/busybox-1.36.1
cp /vagrant/configs/busybox/busydefconfig .config

make -j 8

make install

cd /root

mkdir initramfs

mkdir -p initramfs/bin initramfs/sbin initramfs/etc initramfs/proc initramfs/sys initramfs/dev initramfs/usr/bin initramfs/usr/sbin initramfs/opt initramfs/etc/init.d

#cp /vagrant/inittab ./initramfs/etc/
cp /vagrant/binaries/* ./initramfs/bin

cp -a busybox-1.36.1/_install/* ./initramfs

cat << EOF > initramfs/init
#!/bin/sh

/bin/mount -t devtmpfs devtmpfs /dev
/bin/mount -t proc none /proc
/bin/mount -t sysfs none /sys
                                                                                 
# https://busybox.net/FAQ.html#job_control
                                                      
#mknod /dev/ttyS0 c 4 64
#setsid sh -c 'exec sh </dev/ttyS0 >/dev/ttyS0 2>&1'
echo "Welcome to my Linux!"
exec /bin/sh
EOF

chmod +x initramfs/init


cd initramfs
find . -print0 | cpio --null -ov --format=newc | gzip -9 > ../initramfs.cpio.gz
cd ..

mv initramfs.cpio.gz /vagrant
