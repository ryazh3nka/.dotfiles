# .dotfiles
here lies a list of dotfiles featuring the everforest colorscheme (its darkest flavour) i made in the span of one month. while i can't guarantee full reproducibilty of my setup, i tried to make it distribution-agnostic, hence no install script. the advised way of managing the files is via tools like `GNU Stow` or plain old symlinking. feel free to use the configs provided in the repo as you please (though your eyes might start to bleed after seeing my css skills).

## gallery
<p align="center">
  <img src="https://github.com/user-attachments/assets/5937ca79-af04-4a9f-8ec0-0e4c4db16412" alt="screenshot1" width="49%">
  <img src="https://github.com/user-attachments/assets/8cf76210-8396-4bf9-9d57-3b06f2f019c2" alt="screenshot2" width="49%">
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

### tmux
i'm used to managing tmux plugins via `tpm`. install it and press `Prefix-I` to load the plugins.

```zsh
$ mkdir -p ~/.config/tmux/plugins/tpm
$ git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
$ stow .dotfiles/tmux
```

### nvim
install the `lazy.nvim` package manager, copy the config files, and load the plugins. install `clang` and `lua-language-server`, and you should be good to go.

## list of packages
```zsh
# desktop environment stuff
hyprland && hyprpicker && hyprshot && hypridle && hyprcursor
greetd && greetd-tuigreet

# system
networkmanager
pipewire && pipewire-pulse && pipewire-alsa && wireplumber
wl-clipboard

# workflow 
zsh && zsh-autosuggestions && zsh-syntax-highlighting
nvim && nvim-lazy && clang
ranger
waybar && bemenu
foot && tmux

# theming
everforest-gtk-theme-git && everforest-cursor-theme
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
[aesthetic-wallpapers](https://github.com/D3Ext/aesthetic-wallpapers) – some cool wallpapers!</br>
[lanny's qutebrowser colorscheme](https://gist.github.com/Lanny/04704c7860704aef5067491f5332005d) – a script that brings the everforest colors to qutebrowser.</br>
[arkboix's waybar config](https://github.com/arkboix/sway/tree/main/files/.config/waybar) – someone's waybar dotfiles i stole and modified.
