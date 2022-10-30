#! /bin/bash
ln -sf /usr/share/zoneinfo/Canada/Eastern /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "arch" > /etc/hostname
#Grub Install
echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
grub-install
# Use below in case of issues
#grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Arch
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager
systemctl enable sddm.service
echo "passwd
new user
useradd -mG wheel jn
passwd jn
visudo wheel group enable (uncomment wheel )
exit
umount -a
reboot"
