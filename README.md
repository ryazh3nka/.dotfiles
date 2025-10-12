# .dotfiles
this setup was made for my laptop over a few months. it runs Sway with the Gruvbox terminal colorscheme. my workflow is Emacs-centric, so if you’re familiar with its bindings, you’ll see the logic in using the same set of shortcuts across most of the programs i use. the recommended way to manage these files is with GNU Stow or plain old symlinks.

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
export the `$ZDOTDIR` environment variable inside `/etc/zsh/zshenv` to declutter your home directory. keep in mind that this applies to all users.
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
