# emacs-like binds for qutebrowser by Kaligule <code@schauderbasis.de>
#
# Taken from https://gitlab.com/Kaligule/qutebrowser-emacs-config/blob/master/config.py
# and slightly modified since the command naming is different now

config.unbind("<Ctrl-x>")
config.unbind("<Ctrl-f>")
config.unbind("<Ctrl-s>")
config.unbind("<Ctrl-n>")
config.unbind("<Ctrl-p>")
config.unbind("<Ctrl-u>")

config.bind("<Ctrl-x><Ctrl-l>", "config-source")

config.bind("<Ctrl-Shift-E>", "edit-text", mode="insert")
c.editor.command = ["emacsclient", "-c", "-a ''", "{file}"]

config.bind("<Alt-,>", "scroll-to-perc 0")
config.bind("<Alt-.>", "scroll-to-perc")

config.bind("b", "fake-key <Left>")
config.bind("n", "fake-key <Down>")
config.bind("p", "fake-key <Up>")
config.bind("f", "fake-key <Right>")

config.bind("<Ctrl-b>", "scroll-px -100 0")
config.bind("<Ctrl-n>", "scroll-px 0 100")
config.bind("<Ctrl-p>", "scroll-px 0 -100")
config.bind("<Ctrl-f>", "scroll-px 0 100")
config.bind("<Ctrl-a>", "back", mode="normal")
config.bind("<Ctrl-e>", "forward", mode="normal")

config.bind("<Ctrl-u><Ctrl-x><Ctrl-f>", "cmd-set-text -s :open -t")
config.bind("<Ctrl-x><Ctrl-f>", "cmd-set-text -s :open")
config.bind("<Ctrl-x>l", "reload")

config.bind("<Ctrl-m>", "mode-enter insert")
config.bind("<Ctrl-g>", "fake-key --global <Escape>")

config.bind("<Ctrl-x><Ctrl-c>", "quit")

config.bind("<Ctrl-x>z", "cmd-repeat-last")

config.bind("<Ctrl-x>0", "tab-close")
config.bind("<Ctrl-x>1", "tab-only")
config.bind("<Ctrl-x>o", "tab-next")
config.bind("<Alt-a>", "tab-prev")
config.bind("<Ctrl-Alt-a>", "tab-move -")
config.bind("<Alt-e>", "tab-next")
config.bind("<Ctrl-Alt-e>", "tab-move +")

config.bind("<Ctrl-s>", "cmd-set-text /", mode="normal")
config.bind("<Ctrl-r>", "cmd-set-text ?", mode="normal")
config.bind("s", "search-next")
config.bind("r", "search-prev")
config.bind("<Ctrl-s>", "search-next", mode="command")
config.bind("<Ctrl-r>", "search-prev", mode="command")

config.bind("+", "zoom-in")
config.bind("-", "zoom-out")

config.bind("<Alt-x>", "cmd-set-text :")
config.bind("<Up>", "command-history-prev", mode="command")
config.bind("<Ctrl-p>", "command-history-prev", mode="command")
config.bind("<Down>", "command-history-next", mode="command")
config.bind("<Ctrl-n>", "command-history-next", mode="command")
config.bind("<Escape>", "mode-leave", mode="command")
config.bind("<Ctrl-g>", "mode-leave", mode="command")
config.bind("<Return>", "command-accept", mode="command")
config.bind("<Ctrl-m>", "command-accept", mode="command")
config.bind("<Shift-Tab>", "completion-item-focus prev", mode="command")
config.bind("<Ctrl-p>", "completion-item-focus prev", mode="command")
config.bind("<Tab>", "completion-item-focus next", mode="command")
config.bind("<Ctrl-n>", "completion-item-focus next", mode="command")

config.bind("<Ctrl-Space>", "hint")
config.bind("<Ctrl-u><Ctrl-Space>", "hint --rapid links tab-bg")
config.bind("<Ctrl-B>", "hint all tab-bg", mode="hint")
config.bind("<Ctrl-F>", "hint links", mode="hint")
config.bind("<Escape>", "mode-leave", mode="hint")
config.bind("<Ctrl-g>", "mode-leave", mode="hint")
config.bind("<Return>", "follow-hint", mode="hint")
config.bind("<Ctrl-m>", "follow-hint", mode="hint")

config.bind("<Alt-w>", "yank")
config.bind("<Ctrl-u><Alt-w>d", "yank domain")
config.bind("<Ctrl-u><Alt-w>p", "yank pretty-url")
config.bind("<Ctrl-u><Alt-w>t", "yank title")

config.bind("<Ctrl-x>c", "config-cycle colors.webpage.darkmode.enabled true false")

config.bind("<Ctrl-x><Ctrl-q>", "download-clear")
config.bind("<Ctrl-x><Ctrl-d>", "download-open")
config.bind("<Ctrl-x><Ctrl-z>", "download-retry")

config.bind("<Ctrl-v>", "spawn mpv {url}")
config.bind("<Ctrl-Shift-v>", "hint links spawn mpv {hint-url}")
