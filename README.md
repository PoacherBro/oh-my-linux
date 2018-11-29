# Oh-my-linux

Include all my linux configuration files, like i3, zsh, vim and so on. Will add one by one.

Linux distribution: **ArchLinux** or **Manjaro**  
Arch: 64bit

## Fonts

To make the VIM, tmux and terminal beautiful, [powerline-fonts](https://github.com/powerline/fonts) is necessary.  

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


## VIM configuration

Personal VIM configuration for VIM8.1, tested under CentOS environment.

This configuration most foucus on Golang development.

## GIT

Currently only add 3 sections: global user info, credential, alias.  

For GIT, I mainly focus on `git log` command which can make so beautiful & readable, until I find a good tool [tig](https://github.com/jonas/tig).  
In Arch, you can install it by `yaourt -S tig`. It is awesome, suggested to try.

## References

1. [GitHub - maximbaz/dotfiles](https://github.com/maximbaz/dotfiles)  
2. [GitHub - Airblader/i3](https://github.com/Airblader/i3)  
3. [GitHub - samrayleung/dotfiles](https://github.com/samrayleung/dotfiles)  

