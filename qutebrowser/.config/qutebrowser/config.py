config.load_autoconfig()

config.bind('td', 'config-cycle colors.webpage.darkmode.enabled true false')
c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.bg = '#282828'

config.bind('<Ctrl-j>', 'completion-item-focus next', mode='command')
config.bind('<Ctrl-k>', 'completion-item-focus prev', mode='command')

config.bind('<Ctrl+j>', 'tab-move +', mode='normal')
config.bind('<Ctrl+k>', 'tab-move -', mode='normal')

config.bind("j", "scroll-px 0 100")
config.bind("k", "scroll-px 0 -100")

config.bind("<Alt-j>", "fake-key <Down>")
config.bind("<Alt-k>", "fake-key <Up>")

c.fonts.default_family = 'UbuntuMono Nerd Font'
c.fonts.default_size = "18pt"

c.url.start_pages = ["~/.config/qutebrowser/startpage.html"]
c.url.searchengines = {
    'DEFAULT':  'https://google.com/search?hl=en&q={}',
}

c.window.title_format = "qutebrowser"

config.source('gruvbox.py')
