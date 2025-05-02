#          _   
# .___ ___| |_  a minimal zsh config
#  / /<_-<| . | with cool plugins
# /___/__/|_|_| made by yours truly
#
# documentation: https://wiki.archlinux.org/title/Zsh
# dotfiles repo: https://github.com/ryazh3nka/.dotfiles

# history
HISTFILE=~/.config/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -e

# compinit
zstyle :compinstall filename '/home/ryazhenka/.zshrc'
autoload -Uz compinit 
compinit

# aliases
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias tmux='tmux -2'
alias econf='nvim ~/.config/hypr/hyprland.conf'
alias fetch='fastfetch --colors-block-range-start 9 --colors-block-width 3'
alias dc='cd' # skill issue
alias sl='ls' # skill issue

# binds
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3~" delete-char

PROMPT='%B%F{green}[I]%f%b %F{white}[%F{blue}%n%F{white}@%F{yellow}%m%F{white}]%F{red}[%~]%f$ '

# zsh-syntax-highlighting
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
