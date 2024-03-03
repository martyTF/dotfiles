#!/usr/bin/env bash

# Change shell to fish
case $SHELL in
    */fish)
        ;;
    *)
        chsh -s $(which fish)
        ;;
esac

# Theming
# Install Catppuccin Mocha Rosewater GTK Theme for flatpak
wget https://github.com/catppuccin/gtk/releases/download/v0.7.1/Catppuccin-Mocha-Standard-Rosewater-Dark.zip
unzip -o -d ~/.themes/ Catppuccin-Mocha-Standard-Rosewater-Dark.zip
rm Catppuccin-Mocha-Standard-Rosewater-Dark.zip

# Flatpak theming
sudo flatpak override --filesystem=~/.themes
sudo flatpak override --filesystem=~/.icons
sudo flatpak override --filesystem=~/.config/gtk-3.0
sudo flatpak override --filesystem=~/.config/gtk-4.0
sudo flatpak override --filesystem=~/.local/share/fonts
sudo flatpak override --env=GTK_THEME=Catppuccin-Mocha-Standard-Rosewater-Dark:dark

# Install dotfiles
git clone https://github.com/martyTF/dotfiles ~/.dotfiles


# Stow dotfiles
for i in $(ls ~/.dotfiles/.config/); do rm -r ~/.config/$i; done; cd ~/.dotfiles; stow .
cd
