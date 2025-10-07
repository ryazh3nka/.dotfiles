#!/bin/sh

while true; do
        printf "Do you wish to unstow the dotfiles? (y/n) "
        IFS= read -r yn

        case $yn in
                [Yy]* ) 
                        command -v stow >/dev/null 2>&1 || {
                                echo "'stow' executable not found. "
                                break
                        }

                        cd "$HOME/.dotfiles" || {
                                echo "Can't find the ~/.dotfiles directory."
                                break
                        }
                        
                        for pkg in */; do
                                stow --delete --verbose 1 $pkg
                        done

                        break;;
                [Nn]* ) exit;;
                * ) echo "Please answer yes or no.";;
        esac
done

command -v yay >/dev/null 2>&1 || {
        echo "'yay' executable not found. Exiting..."
        exit 1
}

yay -Rns sway swaylock swaybg swayidle i3status bemenu mako wl-clipboard xdg-desktop-portal-wlr \
                zsh zsh-autosuggestions zsh-syntax-highlighting neovim-nightly-bin neovim-remote \
                ranger foot tmux zathura zathura-pdf-poppler \
                btop fastfetch pipes.sh cmatrix-git mpd ncmpcpp \
                ttf-ubuntu-nerd ttf-ubuntu-mono-nerd || {
        echo "Some packages could not be removed. Exiting..."
        exit 1
}
