echo "welcome to the installer for martyTF's system, including all installed packages/programs and configuration files"
for i in pacman apt dnf; do which $i 2> /dev/null && PACKAGEMANAGER=$i; done
case $PACKAGEMANAGER in
    pacman)
        bash -c "$(curl https://raw.githubusercontent.com/martyTF/dotfiles/main/install-arch.sh)"
        ;;
    apt)
        bash -c "$(curl https://raw.githubusercontent.com/martyTF/dotfiles/main/install-debian.sh)"
        ;;
    dnf)
        bash -c "$(curl https://raw.githubusercontent.com/martyTF/dotfiles/main/install-fedora.sh)"
        ;;
    *)
        echo "none of the supported package managers (so far only arch's pacman/yay) found, won't install any system packages, please do so manually yourself"
        ;;
    esac

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
        mkdir ~/git
         git clone https://github.com/ivan-hc/AM.git ~/git/am
         cd ~/git/am; chmod a+x INSTALL
         sudo ./INSTALL
         ;;
    esac
cd

# Universal - configure atuin
curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh

# Universal - flatpak
flatpak install -y flathub org.signal.Signal dev.vencord.Vesktop com.github.iwalton3.jellyfin-media-player com.nextcloud.desktopclient.nextcloud org.gimp.GIMP org.mozilla.Thunderbird org.telegram.desktop org.prismlauncher.PrismLauncher hu.kramo.Cartridges chat.revolt.RevoltDesktop

# Universal - am
am install feishin
am install jan

# Configuration

bash -c "$(curl https://raw.githubusercontent.com/martyTF/dotfiles/main/configure.sh)"
