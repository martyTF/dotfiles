#!/usr/bin/env bash

# Change shell to fish
case $SHELL in
    */fish)
        ;;
    *)
        chsh -s /usr/bin/fish
        ;;
    esac

# enable wakeonlan
ETHERNET=$(ls /sys/class/net | grep en)
ADDRESS=$(cat /sys/class/net/$ETHERNET/address)
sudo echo "ACTION==\"add\", ATTRS{address}==\"$ADDRESS\", RUN+=\"/usr/sbin/ethtool -s  wol g\"" > /usr/lib/udev/rules.d/51-wakeonlan.rules
sudo udevadm control --reload

# THEMING
# Flatpak theming
sudo flatpak override --filesystem=~/.themes
sudo flatpak override --filesystem=~/.icons
sudo flatpak override --filesystem=~/.config/gtk-3.0
sudo flatpak override --filesystem=~/.config/gtk-4.0
sudo flatpak override --filesystem=~/.local/share/fonts
sudo flatpak override --env=GTK_THEME=Catppuccin-Mocha-Standard-Rosewater-Dark:dark

# DOTFILES
# Install dotfiles
ls ~/.dotfiles 2> /dev/null && ISDOTFILES=yes || ISDOTFILES=no
case $ISDOTFILES in
    no)
        git clone https://github.com/martyTF/dotfiles ~/.dotfiles
        ;;
    yes)
        cd ~/.dotfiles
        git pull --rebase
        cd
        ;;
    esac


# Stow dotfiles
for i in $(ls ~/.dotfiles/.config); do
    ls ~/.bak-config/ | grep $i || mv ~/.config/$i ~/.bak-config/$i;
done
cd ~/.dotfiles; stow .; cd

# make scripts executable
# waybar
chmod +x ~/.config/waybar/scripts/*
# wofi
chmod +x ~/.config/wofi/*.sh
# ranger
chmod +x ~/.config/ranger/scope.sh

# make .local/bin executable
# .local/bin
chmod +x ~/.local/bin/*

# remove sudo requirement from a few commands
sudo chmod +s $(which light)
sudo chmod +s $(which rtcwake)
sudo chmod +s $(which chvt)
sudo chmod +s $(which systemctl)
