# .dotfiles
this is a side branch of my dotfiles repo featuring sway and the gruvbox terminal colorscheme. this setup was made for my laptop, so my primary goal was to make it as minimal as possible (still a work in progress though). the advised way of managing the files is via tools like `GNU Stow` or plain old symlinking. feel free to use the configs provided in the repo as you please (though your eyes might start to bleed after seeing my css skills).

## gallery
<p align="center">
  <img src="https://github.com/user-attachments/assets/4d57452a-d96a-46bf-ae50-894358ef10b5" alt="screenshot1" width="49%">
  <img src="https://github.com/user-attachments/assets/e659d672-3585-4d59-af0a-e7af34fd01c3" alt="screenshot2" width="49%">
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
install the `lazy.nvim` package manager, copy the config files, and load the plugins. install `clang`, `lua-language-server` and `pylsp`, and you should be good to go.

## list of packages
```zsh
# desktop environment stuff
sway && swaylock && swaybg && swayidle
greetd && greetd-tuigreet

# system
networkmanager
pipewire && pipewire-pulse && pipewire-alsa && wireplumber
wl-clipboard

# workflow 
zsh && zsh-autosuggestions && zsh-syntax-highlighting
nvim && nvim-lazy && clang
ranger
bemenu
foot

# utilities
hyprpicker
grim && slurp

# theming
gruvbox-gtk-theme 
gowall
nwg-look

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
[The Compiler's qutebrowser colorscheme](https://github.com/The-Compiler/dotfiles/blob/master/qutebrowser/gruvbox.py) – a script that brings the gruvbox colors to qutebrowser.</br>
[aesthetic-wallpapers](https://github.com/D3Ext/aesthetic-wallpapers) – some cool wallpapers!</br>
