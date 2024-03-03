#!/usr/bin/env bash

# Arch Linux - pacman
sudo pacman -S --noconfirm git stow emacs flatpak firefox fish lib32-amdvlk steam wofi hyprland waybar atuin ranger gnome-keyring btop fuse nautilus nwg-look mpv neofetch pavucontrol xdg-desktop-portal-gtk kdeconnect swaylock

# Arch Linux - install yay
case $(which yay) in
    /usr/bin/yay)
        echo "yay already installed, skipping"
        ;;
    *)
         git clone https://aur.archlinux.org/yay.git ~/git/yay
         cd ~/git/yay
         makepkg -is --noconfirm
         ;;
    esac
cd

# Arch Linux - yay
for i in swww waypaper grimshot protonmail-bridge cava asciiquarium-transparent-git catppuccin-gtk-theme-mocha clipman nerdfetch bunnyfetch fastfetch unzip; do pacman -Qm | grep "^$i " && echo "$i is installed, skipping" || yay -S --noconfirm $i; done

# Universal - install doom emacs
case config.el in
    $(ls $HOME/.config/doom))
        echo "doom emacs installed, skipping"
        ;;
    *)
        git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
        ~/.config/emacs/bin/doom install
        ;;
    esac
cd

# Universal - install am
case $(which am) in
    /usr/local/bin/am)
        echo "am already installed, skipping"
        ;;
    *)
         git clone https://github.com/ivan-hc/AM.git ~/git/am
         cd ~/git/am; chmod a+x INSTALL
         sudo ./INSTALL
         ;;
    esac
cd


# Universal - flatpak
flatpak install -y flathub org.signal.Signal dev.vencord.Vesktop com.github.iwalton3.jellyfin-media-player com.nextcloud.desktopclient.nextcloud org.gimp.GIMP org.mozilla.Thunderbird org.telegram.desktop org.prismlauncher.PrismLauncher hu.kramo.Cartridges chat.revolt.RevoltDesktop

# Universal - am
am install feishin
