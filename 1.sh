#! /bin/bash

timedatectl set-ntp true
mkfs.ext4 /dev/nvme1n1p2
mkswap /dev/sdb3
mount /dev/nvme1n1p2 /mnt
mkdir -p /mnt/boot/efi
swapon /dev/sdb3
mount /dev/nvme1n1p1 /mnt/boot/efi
pacstrap -K /mnt base linux linux-firmware vim grub efibootmgr networkmanager network-manager-applet wireless_tools wpa_supplicant dialog os-prober mtools dosfstools base-devel headers git cups ntfs-3g nvidia nvidia-utils packagekit-qt5 firefox curl wget xorg plasma kde-applications
genfstab -U /mnt >> /mnt/etc/fstab
echo "Done"
echo "arch-chroot /mnt and run 2"
