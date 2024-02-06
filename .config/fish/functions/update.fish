function update
sudo dnf update -y rpmfusion-nonfree-release rpmfusion-free-release fedora-repos nobara-repos --refresh && sudo dnf distro-sync --refresh
sudo dnf update -y --refresh
flatpak update -y
am update
doom sync
end
