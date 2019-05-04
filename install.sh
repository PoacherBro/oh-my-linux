# /bin/bash

# fonts
sudo pacman -S ttf-dejavu otf-fira-code awesome-terminal-fonts otf-font-awesome ttf-roboto noto-fonts noto-fonts-cjk noto-fonts-emoji adobe-source-code-pro-fonts adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts powerline powerline-fonts

# softwares
sudo pacman -S tmux git tig the_silver_searcher ripgrep fzf flameshot zsh

# in archlinuxcn, pls set archlinuxcn in /etc/pacman.conf first
sudo ln -sf $PWD/system/pacman.d/archlinuxcn /etc/pacman.d/archlinuxcn
sudo echo "\n\n[archlinuxcn]\nSigLevel = Optional TrustedOnly\nInclude = /etc/pacman.d/archlinuxcn\n" >> /etc/pacman.conf
sudo pacman -Syu
sudo pacman -S archlinuxcn-keyring

sudo pacman -S visual-studio-code-bin google-chrome

# window/icon theme
sudo pacman -S arc-solid-gtk-theme arc-gtk-theme paper-icon-theme

# for i3 software
sudo pacman -S compton feh xautolock dunst

# for audio control & driver
sudo pacman -S pulseaudio pulseaudio-alsa pasystray pavucontrol paprefs

# config touchpad
sudo ln -sf $PWD/system/touchpad/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf

# input method
sudo pacman -S ibus-rime

# config i3 notification
mkdir ~/.config/dunst
ln -s $PWD/.config/dunst/dunstrc ~/.config/dunst/dunstrc
systemctl --user enable dunst

# config git libsecret, which is for username/password storage
cd /usr/share/git/credential/libsecret
sudo make
cd -

# install oh-my-zsh and change to default zsh
cd
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cd -

ln -sf $PWD/.xinitrc ~/.xinitrc
ln -sf $PWD/.Xdefaults ~/.Xdefaults
ln -sf $PWD/.Xresources ~/.Xresources
ln -sf $PWD/.xprofile ~/.xprofile

# .config
ln -sf $PWD/.i3/config ~/.config/i3/config
ln -sf $PWD/.i3status.conf ~/.i3status.conf
mkdir -p ~/.config/rofi
ln -sf $PWD/.config/rofi/config.rasi ~/.config/rofi/config.rasi
mkdir -p ~/.config/alacritty
ln -sf $PWD/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
mkdir -p ~/.config/fontconfig
ln -sf $PWD/.config/fontconfig/fonts.conf ~/.config/fontconfig/fonts.conf
fc-cache -fv

# xfce4 terminal themes
mkdir -p ~/.local/share/xfce4/terminal/colorschemes
cp /usr/share/xfce4/terminal/colorschemes/*.theme ~/.local/share/xfce4/terminal/colorschemes
curl https://raw.githubusercontent.com/morhetz/gruvbox-contrib/master/xfce4-terminal/gruvbox-dark-soft.theme -o ~/.local/share/xfce4/terminal/colorschemes/gruvbox-dark-soft.theme

ln -sf $PWD/.gitconfig ~/.gitconfig
ln -sf $PWD/.tmux.conf ~/.tmux.conf

# install vim plugins
sudo pacman -S cmake 
ln -sf $PWD/.vimrc ~/.vimrc

mkdir -p ~/.config/Code/User
cp -f $PWD/.config/Code/User/settings.json ~/.config/Code/User/
