# .dotfiles
This setup was made for my laptop over a few months. I must admit that I grew very fond of Emacs, so if you’re familiar with its bindings, you’ll see the logic in using the same set of shortcuts across most of the programs. The recommended way to manage these files is with GNU Stow or plain old symlinks.

## Gallery
<p align="center">
    <img src="https://github.com/user-attachments/assets/283cb2fa-38a6-4ab0-8725-f727a1d286fb" alt="screenshot1" width="49%">
    <img src="https://github.com/user-attachments/assets/81ebc36d-1aed-46f5-a100-a564d7b25195" alt="screenshot2" width="49%">
</p>

*wallpaper: "The Ninth Wave" by I. K. Aivazovsky*</br>
*apps shown: emacs, qutebrowser, foot*

## Installation
Clone and cd into the repo, make sure that `.config`, `.local` and `.cache` exist in your `$HOME`, run `stow package-name` for every directory you want symlinked (or `stow */` to link every package at once), and tweak the dotfiles to your liking.
```zsh
$ git clone --depth 1 https://github.com/ryazh3nka/.dotfiles.git $HOME/.dotfiles
$ cd $HOME/.dotfiles
$ yay -S --needed - < PACKAGES.md
$ mkdir -p $HOME/{.config,.cache,.local/share,.local/bin}
$ stow package
```
Also, to make these configs really plug-and-play, I added a script `clean.sh` that will nuke all leftover junk from a package after unstowing so it won't pollute your `$HOME` (don't pass any arguments to clean all data at once). Usage: `./clean.sh <package-name>`.

The GTK3 theme is [Gruvbox](https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme), and the icon pack is [Delft](https://github.com/madmaxms/iconpack-delft). Each package in this repo contains a separate readme (ignored by stow) with more thorough explanation of the install process.
