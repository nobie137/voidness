#!/bin/bash
clear
echo -e "\t            _     _
\t__   _____ (_) __| |_ __   ___  ___ ___
\t\\ \\ / / _ \\| |/ _\` | '_ \\ / _ \\/ __/ __|
\t \\ V / (_) | | (_| | | | |  __/\\__ \\__ \\
\t  \\_/ \\___/|_|\\__,_|_| |_|\\___||___/___/
"

#Variables
dir="$(pwd)"
cpus="$(nproc)"


#Dirs
mkdir $HOME/txt \
    $HOME/.fonts \
    $HOME/Code $HOME/Code/Shell \
    $HOME/suckless \
    $HOME/.config \
    $HOME/.config/alacritty \
    $HOME/.config/zathura \
    $HOME/.icons \
    $HOME/.icons/default
chmod 755 $HOME/.fonts

#Update system
sudo xbps-install -Syy
sudo xbps-install -u xbps
sudo xbps-install -Syu

#Packages
sudo xbps-install -S --yes base-devel xorg libXft-devel libX11-devel libXinerama-devel libXt-devel libcurl-devel dbus-devel dbus-glib-devel curl wget xtools ranger xdg-desktop-portal pulseaudio pulseaudio-devel ntp pcmanfm firefox nodejs htop mpv feh terminus-font vim alacritty fzf cmus gnupg gtk+3-devel p7zip mercurial olm python3-pip zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps zip imwheel python git tar

#Resources
git clone https://github.com/nobie137/dotfiles $dir/dotfiles
git clone https://github.com/nobie137/ShellScripts $dir/scripts
touch $HOME/.Xauthority

#Move resources/configs
sudo mv $dir/scripts/* /usr/bin
mv $dir/dotfiles/.bashrc \
    $dir/dotfiles/.dir_colors \
    $dir/dotfiles/.xinitrc \
    $dir/dotfiles/.vimrc \
    $dir/dotfiles/.imwheelrc \
    $HOME
mv $dir/dotfiles/alacritty.yml $HOME/.config/alacritty
mv $dir/dotfiles/zathurarc $HOME/.config/zathura/zathurarc
xdg-mime default org.pwmt.zathura.desktop application/pdf

#Download and compile dwm and dmenu
git clone https://github.com/nobie137/dwm $HOME/suckless/dwm
git clone https://git.suckless.org/dmenu $HOME/suckless/dmenu
sudo make clean install -C $HOME/suckless/dwm -j $cpus
sudo make clean install -C $HOME/suckless/dwm -j $cpus

#Cursor
mv $dir/dotfiles/cursor/Tumi\'s-3D-Crystal-linux-cursors.tar.gz $HOME/.local/share/icons
tar -xvf $HOME/.local/share/icons/Tumi\'s-3D-Crystal-linux-cursors.tar.gz -C $HOME/.local/share/incons
sudo echo -e "[Icon Theme]\nName=Default\nComment=Default Cursor Theme\nInherits=Tumi's-3D-Crystal" > .icons/default/index.theme

#Font
mv $dir/dotfiles/font/* $HOME/.fonts

#Cleanup
rm -rf $dir

#Reboot
reboot
# This file is written by LXAppearance. Do not edit.
