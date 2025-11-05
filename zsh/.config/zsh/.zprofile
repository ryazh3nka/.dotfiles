export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    eval "$(ssh-agent -s)" > /dev/null
    ssh-add ~/.ssh/id_ed25519 < /dev/null
fi
