# .dotfiles
this is a side branch of my dotfiles repo featuring sway and the gruvbox terminal colorscheme. this setup was made for my laptop, so my primary goal was to make it as minimal as possible (still a work in progress though). the advised way of managing the files is via tools like `GNU Stow` or plain old symlinking. feel free to use the configs provided in the repo as you please (though your eyes might start to bleed after seeing my css skills).

## gallery
<p align="center">
  <img src="https://github.com/user-attachments/assets/3d929b02-190f-4860-92eb-2dcf07de4243" alt="screenshot1" width="49%">
  <img src="https://github.com/user-attachments/assets/93df3c00-65bd-4d95-bb7c-ec59b10fc25c" alt="screenshot2" width="49%">
</p>

## installation
make backups of your `.config` directory, clone and cd into the repo, then run `stow package-name` for every folder you want symlinked, and tweak the dotfiles to your liking. for programs that need additional configuration, see the list below.

### zsh
export the `$ZDOTDIR` environment variable inside `/etc/zsh/zshenv`, then create the `~/.config/zsh` folder and continue like usual.
```zsh
export ZDOTDIR="$HOME"/.config/zsh
```
```zsh
$ mkdir -p ~/.config/zsh
$ stow .dotfiles/zsh
```

### nvim
install LazyVim as per distribution instructions, copy the config files, and load the plugins. i would also recommend installing `Neovide` – it's a fast and sleek GUI client for neovim.

## list of packages
```zsh
# desktop environment stuff
sway && swaylock && swaybg && swayidle
greetd && greetd-tuigreet
i3status
bemenu
mako

# system
networkmanager
pipewire && pipewire-pulse && pipewire-alsa && wireplumber
wl-clipboard
xdg-desktop-portal-wlr

# workflow 
zsh && zsh-autosuggestions && zsh-syntax-highlighting
nvim && lazyvim
ranger
foot && tmux
zathura && zathura-pdf-poppler

# misc
btop
fastfetch
pipes.sh
cmatrix-git
mpd && ncmpcpp

# fonts
ttf-ubuntu-nerd && ttf-ubuntu-mono-nerd
noto-fonts
```

## check these out too
[The Compiler's qutebrowser colorscheme](https://github.com/The-Compiler/dotfiles/blob/master/qutebrowser/gruvbox.py) – a script that brings the gruvbox colors to qutebrowser</br>
[aesthetic-wallpapers](https://github.com/D3Ext/aesthetic-wallpapers) – some cool wallpapers!</br>
[eastack's zathura theme](https://github.com/eastack/zathura-gruvbox) – a zathura theme that makes reading real cozy</br>
[rexim's github](https://github.com/rexim) – a certain someone that got me inspired
