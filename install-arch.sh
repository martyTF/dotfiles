#!/usr/bin/env bash

# Arch Linux - pacman
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm git stow emacs flatpak firefox fish lib32-amdvlk steam wofi hyprland waybar atuin ranger gnome-keyring btop fuse nautilus nwg-look mpv neofetch pavucontrol xdg-desktop-portal-gtk kdeconnect swaylock wget less

# Arch Linux - install yay
case $(which yay) in
    /usr/bin/yay)
        echo "yay already installed, skipping"
        ;;
    *)
        mkdir ~/git
         git clone https://aur.archlinux.org/yay.git ~/git/yay
         cd ~/git/yay
         makepkg -is --noconfirm
         ;;
    esac
cd

# Arch Linux - yay
sudo chmod +s $(which yay)
for i in swww waypaper grimshot protonmail-bridge cava asciiquarium-transparent-git catppuccin-gtk-theme-mocha clipman nerdfetch bunnyfetch fastfetch unzip steamtinkerlaunch fd ripgrep shellcheck tidy stylelint js-beautify mako nwg-look protontricks light; do pacman -Qm | grep "^$i " && echo "$i is installed, skipping" || yay -S --noconfirm $i; done
sudo chmod -s $(which yay)
