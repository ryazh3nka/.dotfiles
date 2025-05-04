HISTFILE=~/.config/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -e

alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias tmux='tmux -2'
alias econf='nvim ~/.config/hypr/hyprland.conf'
alias fetch='fastfetch --colors-block-range-start 9 --colors-block-width 3'
alias dc='cd' # skill issue
alias sl='ls' # skill issue

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3~" delete-char

PROMPT='%B%F{green}[I]%f%b %F{white}[%F{blue}%n%F{white}@%F{yellow}%m%F{white}]%F{red}[%~]%f$ '

autoload -Uz compinit
compinit -C

# zsh-syntax-highlighting
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
