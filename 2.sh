#! /bin/bash
ln -sf /usr/share/zoneinfo/Canada/Eastern /etc/localtime
hwclock --systohc
#Edit /etc/locale.gen and uncomment en_US.UTF-8 UTF-8 and other needed locales. Generate the locales by running:
locale-gen
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "arch" > /etc/hostname
