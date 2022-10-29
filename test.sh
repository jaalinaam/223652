#! /bin/bash
echo " passwd
new user
useradd -mG wheel jn
passwd jn
#visudo wheel group enable (uncomment wheel )
exit
umount -a
reboot"
