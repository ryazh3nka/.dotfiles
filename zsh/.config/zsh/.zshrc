export PATH=$PATH:$HOME/.local/bin

HISTFILE=~/.config/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -e

alias ls="ls --color=auto"
alias l="ls -lh --color=auto --sort=extension"
alias ll="ls -lAh --color=auto --sort=extension"
alias wget="wget --hsts-file ~/.local/share/wget/wget-hsts"

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3~" delete-char

autoload -Uz compinit
compinit -C

# zsh-syntax-highlighting
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

PROMPT='%B%F{10}[I]%f%b %F{15}[%F{12}%n%F{15}@%F{11}%m%F{15}]%F{9}[%~]%f$ '

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
