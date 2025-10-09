# .dotfiles
this setup was made for my laptop over the course of a few months. among other things, it features Sway and the Gruvbox terminal colorscheme. my goal is to make it as minimal as possible (still a work in progress though). the recommended way to manage the files is with tools like GNU Stow or plain old symlinks. feel free to use the configs provided in the repo as you please. all package names that i mention should be valid entries in the Arch repos.

## gallery
<p align="center">
    <img src="https://github.com/user-attachments/assets/3d929b02-190f-4860-92eb-2dcf07de4243" alt="screenshot1" width="49%">
    <img src="https://github.com/user-attachments/assets/93df3c00-65bd-4d95-bb7c-ec59b10fc25c" alt="screenshot2" width="49%">
</p>

## installation
make backups of your `.config` directory, clone and cd into the repo, then run `stow package-name` for every folder you want symlinked, and tweak the dotfiles to your liking. for programs that need additional configuration, see the list below.
```zsh
$ git clone --depth 1 https://github.com/ryazh3nka/.dotfiles.git $HOME/.dotfiles
$ yay -Sy --needed - < "$HOME/.dotfiles/PACKAGES.md"
```

### zsh
export the `$ZDOTDIR` environment variable inside `/etc/zsh/zshenv` to declutter you home directory from *rc files. keep in mind that this applies to all users.
```zsh
export ZDOTDIR="$HOME"/.config/zsh
```

### nvim
my configs will only work if you have Neovim v12.0 installed (i use nightly builds personally). my setup has zero dependencies and it uses the built-in plugin manager. if you want a cool GUI front-end, check out Neovide.

by the way, you don't need LSPs if you have a compiler, just use :make and :copen.

## scripts
i like to keep my scripts in `~/.local/bin`, so you might want to create that directory beforehand.
```zsh
$ mkdir -p ~/.local/bin
```

here's a short list of them:
- `update-restow` would prompt to update all installed packages and restow all directories in the repo

## check these out too
[morhetz' theme for vim](https://github.com/morhetz/gruvbox) – a beautiful color palette that defines my setup</br>
[The Compiler's theme for qutebrowser](https://github.com/The-Compiler/dotfiles/blob/master/qutebrowser/gruvbox.py) – a script that brings the same cool earthy colors to Qutebrowser</br>
[eastack's theme for zathura](https://github.com/eastack/zathura-gruvbox) – a Zathura theme that makes reading real cozy</br>
[rexim's github](https://github.com/rexim) – a certain someone that got me inspired</br>
