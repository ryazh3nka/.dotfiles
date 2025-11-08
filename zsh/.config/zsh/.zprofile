if ! pgrep -u "$USER" ssh-agent > /dev/null; then
        eval "$(ssh-agent -s)" > /dev/null
        if [ -f "$HOME/.ssh/id_ed25519" ]; then
                ssh-add "$HOME/.ssh/id_ed25519" < /dev/null
        fi
else
        export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi

