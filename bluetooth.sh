#! /bin/bash
yes | sudo pacman -S pipewire pipewire-pulse pipewire-alsa
echo "Installation Complete"
sudo systemctl start bluetooth.service
echo "start"
sudo systemctl enable bluetooth.service
echo "Done"
