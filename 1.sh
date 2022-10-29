#! /bin/bash

timedatectl set-ntp true
mkfs.ext4 /dev/nvme1n1p2
mkswap /dev/sdb3
mount /dev/nvme1n1p2 /mnt
mkdir /mnt/boot/efi
swapon /dev/sdb3
mount /dev/nvme1n1p1 /mnt/boot/efi
pacstrap -K /mnt base linux linux-firmware vim grub efibootmgr networkmanager network-manager-applet wireless_tools wpa_supplicant dialog os-prober mtools dosfstools base-devel headers git cups ntfs-3g nvidia nvidia-utils packagekit-qt5 firefox curl wget xorg plasma kde-applications
genfstab -U /mnt >> /mnt/etc/fstab
echo "Done"
echo "arch-chroot /mnt and run 2"

#################
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Canada/Eastern /etc/localtime
hwclock --systohc
#Edit /etc/locale.gen and uncomment en_US.UTF-8 UTF-8 and other needed locales. Generate the locales by running:
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "arch" > /etc/hostname

#/etc/hosts
#127.0.0.1	localhost
#::1		localhost
#127.0.1.1	myhostname.localdomain	myhostname

#################
==============================

=====================
Bluetooth: refine next time
sudo pacman -S pipewire pipewire-pulse pipewire-alsa
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
#################
Grub Install
echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
grub-install --target=x86_64-efi --efi-directory=/boot/efi--bootloader-id=Arch
grub-mkconfig -o /boot/grub/grub.cfg
#################
passwd
new user
useradd -mG wheel jn
passwd jn
#visudo wheel group enable (uncomment wheel )
systemctl enable NetworkManager
systemctl enable sddm.service
exit
umount -a
reboot

