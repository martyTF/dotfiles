#!/usr/bin/env bash

# Change shell to fish
case $SHELL in
    */fish)
        ;;
    *)
        chsh -s /usr/bin/fish
        ;;
    esac

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
ls ~/.bak-config 2> /dev/null && ISSTOW=yes || ISSTOW=no
case $ISSTOW in
    no)
        mkdir ~/.bak-config
        for i in $(ls ~/.dotfiles/.config/); do mv ~/.config/$i ~/.bak-config/$i; done
        cd ~/.dotfiles
        stow .
        cd
        ;;
    yes)
        cd ~/.dotfiles
        stow .
        cd
        ;;
    esac

# make scripts executable
# waybar
chmod +x ~/.config/waybar/scripts/*
# wofi
chmod +x ~/.config/wofi/power.sh
# ranger
chmod +x ~/.config/ranger/scope.sh

# make .local/bin executable
# .local/bin
chmod +x ~/.local/bin/*

# remove sudo requirement from a few commands
sudo chmod +s $(which light)
sudo chmod +s $(which rtcwake)
