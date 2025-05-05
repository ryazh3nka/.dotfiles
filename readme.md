# .dotfiles
here lies a list of dotfiles featuring nord colors i made in the span of two weeks. while i can't guarantee full reproducibilty of my setup, i tried to make it distribution-agnostic, hence no install script. the advised way of managing the files is via tools like `GNU Stow` or plain old symlinking. feel free to use the configs provided in the repo as you please (though your eyes will probably start to bleed after seeing my css skills).

## gallery
<p align="center">
  <img src="https://github.com/user-attachments/assets/2f92b88d-c88f-47e4-b404-a684a3a4c97a" alt="screenshot1">
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

### firefox
you can find the nord colorscheme for firefox in the built-in theme browser, but it doesn't look nice with shadows enabled. paste this inside your `userChrome.css` to disable them.
```css
.titlebar-buttonbox-container{ display:none }

* {
    box-shadow: none !important;
    --panel-shadow: none !important;
    -moz-window-shadow: none
}
```

### nvim
install the `lazy.nvim` package manager and language servers you need, and you should be good to go.

### tmux
i'm used to managing tmux plugins via `tpm`. install it and press `Prefix-I` to load the plugins.

```zsh
$ mkdir -p ~/.config/tmux/plugins/tpm
$ git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
$ stow .dotfiles/tmux
```

## list of packages
```zsh
# desktop environment stuff
hyprland && hyprpicker && hyprshot && hypridle && hyprcursor && hyprlock
xdg-desktop-portal-hyprland
greetd && greetd-tuigreet
networkmanager
pipewire && pipewire-pulse && pipewire-alsa && wireplumber
wl-clipboard

# workflow 
zsh && zsh-autosuggestions && zsh-syntax-highlighting
foot
nvim && nvim-lazy
clang && lua-language-server
tmux

# the eye-candy
waybar
wofi
nordic-theme && nordzy-icon-theme && nordzy-hyprcursors

# misc
btop
nwg-look
fastfetch
pipes.sh
cmatrix-git
mpd && ncmpcpp

# fonts
ttf-ubuntu-nerd && ttf-ubuntu-mono-nerd
ttf-hack-nerd
ttf-iosevka-nerd
```

## check these out too
[qwool 1337's rice](https://www.reddit.com/r/unixporn/comments/17appad/hyprland_dwmthemed_waybar_and_everything_w_base16/) – the guy i stole the waybar layout from</br>
[nord colorscheme](https://www.nordtheme.com/) – the color palette that inspired me to make this rice</br>
[nordic wallpapers](https://github.com/linuxdotexe/nordic-wallpapers) – the repo i stole the wallpaper from (can't seem to find the original author to give credit)</br>
[fastfetch config collection](https://github.com/LierB/fastfetch) – the repo i stole the fastfetch config and ASCII art from</br>
[nord theme for qutebrowser](https://github.com/Linuus/nord-qutebrowser) – didn't add to the repo because i made no other changes</br>
[nord theme for firefox](https://addons.mozilla.org/en-US/firefox/addon/nord123/) – self explanatory. i also removed the shadows inside userChrome.css
