# .dotfiles
this setup was made for my laptop over a few months. it runs Sway with the Gruvbox terminal colorscheme. my workflow is Emacs-centric, so if you’re familiar with its bindings, you’ll see the logic in using the same set of shortcuts across most of the programs i use. the recommended way to manage these files is with GNU Stow or plain old symlinks.

## gallery
<p align="center">
    <img src="https://github.com/user-attachments/assets/3d929b02-190f-4860-92eb-2dcf07de4243" alt="screenshot1" width="49%">
    <img src="https://github.com/user-attachments/assets/93df3c00-65bd-4d95-bb7c-ec59b10fc25c" alt="screenshot2" width="49%">
</p>

## installation
make backups of your `.config` directory, clone and cd into the repo, install the dependencies, then run `stow package-name` for every folder you want symlinked, and tweak the dotfiles to your liking.

for programs that like to paste junk into your config (i'm looking at you, Emacs), make use of the `--no-folding` flag to create the target directory beforehand.
```zsh
$ git clone --depth 1 https://github.com/ryazh3nka/.dotfiles.git $HOME/.dotfiles
$ yay -Sy --needed - < "$HOME/.dotfiles/PACKAGES.md"
$ stow -v --no-folding <package-name>
```
also, each package in this repo contains a separate readme (ignored by stow) with more thorough explanation of the install process.
