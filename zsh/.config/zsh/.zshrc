HISTFILE="$XDG_CACHE_HOME/.zsh_history"
HISTSIZE=5000
SAVEHIST=5000

export LESS='-R --use-color -Dd+c$Du+b$'
export MANROFFOPT='-P -c'
export GPG_TTY=$(tty)

setopt share_history
setopt extendedglob
setopt NO_CASE_GLOB

alias ls='ls --color=auto'
alias l='ls -lh --color=auto --sort=extension --group-directories-first'
alias ll='ls -lAh --color=auto --sort=extension --group-directories-first'
alias ec="emacsclient -nw -a ''"
alias wget="wget --hsts-file $XDG_CACHE_HOME/.wget_hosts"
alias tmux='tmux -T 256'

if [ "$TERM" = "linux" ]; then
    PROMPT="%B%F{green}[I]%f%b %F{white}[%F{blue}%n%F{white}@%F{yellow}%m%F{white}]%F{red}[%~]%f$ "
else
    PROMPT="%B%F{10}[I]%f%b %F{15}[%F{12}%n%F{15}@%F{11}%m%F{15}]%F{9}[%~]%f$ "
fi

bindkey -e
bindkey "^[n" down-history
bindkey "^[p" up-history

autoload -Uz compinit
compinit -C -d "$XDG_CACHE_HOME/.zsh_zcompdump"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
       'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# zsh-syntax-highlighting
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ocaml package manager
OPAM_INIT="$HOME/.opam/opam-init/init.zsh"
[[ ! -r "$OPAM_INIT" ]] || source "$OPAM_INIT"

# haskell installer
GHCUP_ENV="$XDG_DATA_DIR/ghcup/env"
[[ -f "$GHCUP_ENV" ]] && source "$GHCUP_ENV"
