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
# Install Catppuccin Mocha Rosewater GTK Theme for flatpak
ls ~/.themes 2> /dev/null && ISTHEME=yes || ISTHEME=no
case $ISTHEME in
    no)
        mkdir ~/.themes
        wget https://github.com/catppuccin/gtk/releases/download/v0.7.1/Catppuccin-Mocha-Standard-Rosewater-Dark.zip
        unzip -o -d ~/.themes/ Catppuccin-Mocha-Standard-Rosewater-Dark.zip
        rm Catppuccin-Mocha-Standard-Rosewater-Dark.zip
        ;;
    yes)
        echo "bruh"
        ;;
    esac


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

# remove sudo requirement from backlight command
sudo chmod +s /usr/bin/light
