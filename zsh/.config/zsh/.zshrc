export HISTFILE="$HOME/.cache/zsh/histfile"
export HISTSIZE=5000
export SAVEHIST=5000

export LESS='-R --use-color -Dd+c$Du+b$'
export MANROFFOPT="-P -c"

setopt share_history
setopt extendedglob
setopt NO_CASE_GLOB
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
        'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

alias ls="ls --color=auto"
alias l="ls -lh --color=auto --sort=extension"
alias ll="ls -lAh --color=auto --sort=extension"
alias wget="wget --hsts-file ~/.local/share/wget/wget-hsts"
alias tmux="tmux -T 256"

bindkey -e
bindkey "^[e" down-history
bindkey "^[a" up-history

autoload -Uz compinit
compinit -C -d "$HOME/.cache/zsh/zcompdump"

# zsh-syntax-highlighting
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

PROMPT="%B%F{10}[I]%f%b %F{15}[%F{12}%n%F{15}@%F{11}%m%F{15}]%F{9}[%~]%f$ "

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
