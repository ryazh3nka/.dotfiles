# .dotfiles
this setup was made for my laptop over a few months. it runs Sway with the Gruvbox terminal colorscheme. my workflow is Emacs-centric, so if you’re familiar with its bindings, you’ll see the logic in using the same set of shortcuts across most of the programs. the recommended way to manage these files is with GNU Stow or plain old symlinks.

## gallery
<p align="center">
    <img src="https://github.com/user-attachments/assets/2638b6ad-a60b-4180-b543-d724543caae8" alt="screenshot1" width="49%">
    <img src="https://github.com/user-attachments/assets/283cb2fa-38a6-4ab0-8725-f727a1d286fb" alt="screenshot2" width="49%">
</p>

*wallpaper: "The Ninth Wave" by I. K. Aivazovsky*</br>
*apps shown: emacs, qutebrowser, foot, nvim, pipes.sh, cmatrix*

## installation
make backups of your `.config` directory, clone and cd into the repo, then run `stow package-name` for every folder you want symlinked, and tweak the dotfiles to your liking.

for programs that like to paste junk into your config (i'm looking at you, Emacs), make use of the `--no-folding` flag to create the target directory beforehand.
```zsh
$ git clone --depth 1 https://github.com/ryazh3nka/.dotfiles.git $HOME/.dotfiles
$ cd $HOME/.dotfiles
$ yay -Sy --needed - < PACKAGES.md
$ stow package
```
also, each package in this repo contains a separate readme (ignored by stow) with more thorough explanation of the install process.
