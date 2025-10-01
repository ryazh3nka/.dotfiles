# .dotfiles
this used to be a side branch of my dotfiles, but i grew to like it and now it's my daily driver. featuring Sway and the Gruvbox terminal colorscheme, this setup was made for my laptop, and my primary goal was to make it as minimal as possible (still a work in progress though). the advised way of managing the files is via tools like GNU Stow or plain old symlinking. feel free to use the configs provided in the repo as you please. all package names are valid entries in the Arch repos.

## gallery
<p align="center">
  <img src="https://github.com/user-attachments/assets/3d929b02-190f-4860-92eb-2dcf07de4243" alt="screenshot1" width="49%">
  <img src="https://github.com/user-attachments/assets/93df3c00-65bd-4d95-bb7c-ec59b10fc25c" alt="screenshot2" width="49%">
</p>

## installation
make backups of your `.config` directory, clone and cd into the repo, then run `stow package-name` for every folder you want symlinked, and tweak the dotfiles to your liking. for programs that need additional configuration, see the list below.
```zsh
$ mkdir -p $HOME/.dotfiles
$ git clone https://github.com/ryazh3nka/.dotfiles.git $HOME/.dotfiles
$ cd $HOME/.dotfiles
```

### zsh
export the `$ZDOTDIR` environment variable inside `/etc/zsh/zshenv`, then create the `~/.config/zsh` directory and continue like usual. keep in mind that this applies to all users.
```zsh
export ZDOTDIR="$HOME"/.config/zsh
```
```zsh
$ mkdir -p ~/.config/zsh
$ stow zsh
```

### nvim
my configs will only work if you have Neovim v12.0 installed (i use nightly builds personally). my setup has zero dependencies and it uses the built-in plugin manager (thanks, Vimothee!). if you want a cool GUI front-end, check out Neovide, it's cool as hell.

forgot to mention that i'm kinda opinionated when it comes to my text editors, soo...
- you don't need LSPs if you have a compiler. use :make and quicklist.
- you don't need code completion, it's distracting and unproductive.
- you don't need function signature helpers, just go to definition and see for yourself.
- you don't need to use most of the plugins out there if you really know vim motions.
- you don't need dired (and emacs by extension lol), use oil.nvim.
- you don't need 15 nested folders to keep your config clean.

### emacs
create the `.emacs.d` directory before symlinking anything to keep your cloned repo intact from junk that Emacs likes to paste inside your config. for the same reason you should also download your preferred colorscheme manually.
```zsh
$ mkdir -p ~/.emacs.d
$ stow emacs
```

## scripts
i like to keep my scripts in `~/.local/bin`, so you might want to create that directory beforehand.
```zsh
$ mkdir -p ~/.local/bin
```

here's the short list of them:
- `neovide-open` is a wrapper for Neovim to launch in remote (server) mode with Neovide as its front-end. if you pass any files to the command, they would open as buffers, even if Neovide was already running. especially handy when dealing with mimetypes and desktop entries. needs neovim-remote to work.
- `install-deps` would install every package featured here. NOT recommended as you might end up with megabytes of useless junk. just install those that you need manually. needs yay to work.

## list of packages
```zsh
# desktop environment stuff
sway && swaylock && swaybg && swayidle
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
neovim-nightly-bin && neovim-remote && neovide
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
[The Compiler's qutebrowser colorscheme](https://github.com/The-Compiler/dotfiles/blob/master/qutebrowser/gruvbox.py) – a script that brings the gruvbox colors to Qutebrowser</br>
[aesthetic-wallpapers](https://github.com/D3Ext/aesthetic-wallpapers) – some cool wallpapers!</br>
[eastack's zathura theme](https://github.com/eastack/zathura-gruvbox) – a Zathura theme that makes reading real cozy</br>
[rexim's github](https://github.com/rexim) – a certain someone that got me inspired
