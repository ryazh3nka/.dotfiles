# .dotfiles
this setup was made for my laptop over a few months. i must admit that i grew very fond of Emacs, so if you’re familiar with its bindings, you’ll see the logic in using the same set of shortcuts across most of the programs. the recommended way to manage these files is with GNU Stow or plain old symlinks.

## gallery
<p align="center">
    <img src="https://github.com/user-attachments/assets/283cb2fa-38a6-4ab0-8725-f727a1d286fb" alt="screenshot1" width="49%">
    <img src="https://github.com/user-attachments/assets/81ebc36d-1aed-46f5-a100-a564d7b25195" alt="screenshot2" width="49%">
</p>

*wallpaper: "The Ninth Wave" by I. K. Aivazovsky*</br>
*apps shown: emacs, qutebrowser, foot*

## installation
clone and cd into the repo, make sure that `.config`, `.local` and `.cache` exist in your `$HOME`, run `stow package-name` for every folder you want symlinked, and tweak the dotfiles to your liking.

for programs that like to paste junk into your config (i'm looking at you, Emacs) or more generally to prevent a package from owning the target directory, make use of the `--no-folding` flag to create it before symlinking.
```zsh
$ git clone --depth 1 https://github.com/ryazh3nka/.dotfiles.git $HOME/.dotfiles
$ cd $HOME/.dotfiles
$ yay -S --needed - < PACKAGES.md
$ mkdir -p $HOME/{.config,.cache,.local/share,.local/bin}
$ stow package
```
the GTK3 theme is [Gruvbox](https://aur.archlinux.org/packages/gruvbox-gtk-theme-git), and the icon pack is [Delft](https://aur.archlinux.org/packages/delft-icon-theme). also, each package in this repo contains a separate readme (ignored by stow) with more thorough explanation of the install process.
