# Oh-my-linux

Include all my linux configuration files, like i3, zsh, vim and so on. Will add one by one.

Linux distribution: **ArchLinux** or **Manjaro**  
Arch: 64bit

## Fonts

To make the VIM, tmux and terminal beautiful, [powerline-fonts](https://github.com/powerline/fonts) is necessary.  
But pls note, I follow the configuration instruction in [powerline inline doc](https://powerline.readthedocs.io/en/latest/usage/shell-prompts.html#bash-prompt), 
there is a problem when add below command:  
```sh
source /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh
```
It is ok to see the powerline symbols when don't add above one.  

In Arch or Manjaro, just install with below command:  
```shell
yaourt -S powerline powerline-fonts
```

After install the fonts, follow the configuration instruction in [Arch Wiki - Font configuration](https://wiki.archlinux.org/index.php/Font_configuration) to add settings, and pls be noted that don't use Infinality any more, as it has been stopped maintainance.

The file `.config/fontconfig/fonts.conf` should be placed as `$HOME` directory and use below command to load:  
```shell
FC_DEBUG=1024 leafpad # leafpad is a tool just for testing
```
I just follow this [post](https://unix.stackexchange.com/questions/372447/reload-settings-in-etc-fonts-conf-d), and add some reference for font config:  
1. [Arch Wiki - 简体中文配置](https://wiki.archlinux.org/index.php/Font_Configuration/Chinese_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))  
2. [Linux下终极字体配置方案](https://ohmyarch.github.io/2017/01/15/Linux%E4%B8%8B%E7%BB%88%E6%9E%81%E5%AD%97%E4%BD%93%E9%85%8D%E7%BD%AE%E6%96%B9%E6%A1%88/)  


Suggested fonts:  
```sh
yaourt -S otf-fira-code otf-fira-mono awesome-terminal otf-font-awesome ttf-dejavu ttf-droid ttf-roboto noto-fonts noto-fonts-cjk noto-fonts-emoji adobe-source-code-pro-fonts adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts
```

Note that `noto-fonts` and `source-han-fonts` look are same because all of them are created/designed by Google and Adobe, but the `source-han-fonts` is the upgraded one.

## VIM configuration

Personal VIM configuration for VIM8.1, tested under CentOS environment.

This configuration most foucus on Golang development.

Pls be aware that to use the system clipboard, VIM should be enabled with `+clipboard` option, you can use `vim --version` to check.  
In ArchLinux, we can install the gVIM to replace the pre-installed VIM version: `yaourt -S gvim`.  

Depended 3rd softwares:  
```shell
# ag & rg
yaourt -S the_silver_searcher ripgrep
```

## GIT

Currently only add 3 sections: global user info, credential, alias.  

For GIT, I mainly focus on `git log` command which can make so beautiful & readable, until I find a good tool [tig](https://github.com/jonas/tig).  
In Arch, you can install it by `yaourt -S tig`. It is awesome, suggested to try.

## Touchpad

When use i3, the tapping in touchpad is not enabled defaultly, based on ArchLinux wiki, suggested to use [libinput](https://wiki.archlinux.org/index.php/Libinput) to controll the input device (include keyboard).  
And there is a suggested configuration, see it in `system/touchpad/30-touchpad.conf`, only add 3 options in the **touchpad catchall**, this file is copied from `/usr/share/X11/xorg.conf.d` and should put it in `/etc/X11/xorg.conf.d`.  
```sh
sudo ln -s ~/github/oh-my-linux/system/touchpad/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
```

## Softwares

- git  
- zsh + oh-my-zsh  
- flameshot, for screeshot  
- alacritty, GPU-accessed terminal  
- google-chrome  
- gvim, as VIM has no clipboard option  
- visual-studio-code-bin, awesome code editor  
- clipit + xclip, clip manager  
- fzf, the shortkey of `z`  
- tmux, awesome resue tool of terminal  


## References

1. [GitHub - maximbaz/dotfiles](https://github.com/maximbaz/dotfiles)  
2. [GitHub - Airblader/i3](https://github.com/Airblader/i3)  
3. [GitHub - samrayleung/dotfiles](https://github.com/samrayleung/dotfiles)  
4. [GitHub - addy-dclxvi/i3-starterpack](https://github.com/addy-dclxvi/i3-starterpack)  

