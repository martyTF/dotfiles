# martyTF's Dotfiles

---

### Installation

``` sh
git clone https://github.com/martyTF/dotfiles ~/.dotfiles
cd ~/.dotfiles
./mt_dotfiles install 
```

### Updating

``` sh
mt_dotfiles update
```

### Requirements

#### Installation
these terminal programs will be used to install and update the configuration

- git
- stow
- flatpak

#### Window Manager
these programs are critical to the usage of the window manager, however you can choose between hyprland and sway

- [hyprland](https://hyprland.org/) / [sway](https://swaywm.org/)
- [waybar](https://github.com/Alexays/Waybar)
- [swww](https://github.com/LGFae/swww)
- [waypaper](https://github.com/anufrievroman/waypaper)

#### Applications
as found in the configurations for e.g. autostart or waybar interactions

- [Kitty Terminal](https://sw.kovidgoyal.net/kitty/)
- [Firefox](https://www.mozilla.org//firefox/)
- [Obsidian](http://obsidian.md)
- [Cartridges](https://apps.gnome.org/en-GB/Cartridges/)
- [Steam](https://steampowered.com)
- [Feishin](https://github.com/jeffvli/feishin)
- [Telegram](https://flathub.org/apps/org.telegram.desktop)
- [Signal](https://flathub.org/apps/org.signal.Signal)
- [NewsFlash](https://flathub.org/apps/io.gitlab.news_flash.NewsFlash)
- [GNU Emacs](https://www.gnu.org/software/emacs/)

#### Terminal programs
as found in the configurations and other useful programs

- htop
- asciiquarium
- btop
- cava

#### TODO: Install requirements through the command line

``` sh
# apt (Debian, Ubuntu, Mint, ...)

sudo apt install git stow hyprland sway waybar pip kitty firefox steam emacs htop btop cava flatpak

# dnf (Fedora, Nobara, ...)

sudo dnf install git stow hyprland sway waybar pip kitty firefox steam emacs htop btop cava flatpak


# pacman (Arch, Endeavor, Manjaro, ...)

sudo pacman -Syu git stow hyprland sway waybar pip kitty firefox steam emacs htop btop cava asciiquarium-git flatpak 

```

``` sh
# all distributions


```

