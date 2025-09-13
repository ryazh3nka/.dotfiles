config.load_autoconfig()

# darkmode
config.bind('td', 'config-cycle colors.webpage.darkmode.enabled true false')
c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.bg = '#282828'

# scroll history
config.bind('<Ctrl-j>', 'completion-item-focus next', mode='command')
config.bind('<Ctrl-k>', 'completion-item-focus prev', mode='command')

# move tabs
config.bind('<Ctrl+j>', 'tab-move +', mode='normal')
config.bind('<Ctrl+k>', 'tab-move -', mode='normal')

c.fonts.default_family = 'UbuntuMono Nerd Font'
c.fonts.default_size = "18pt"

# newpage configuration
c.url.start_pages = ["~/.config/qutebrowser/startpage.html"]
c.url.searchengines = {
    'DEFAULT':  'https://google.com/search?hl=en&q={}',
}

c.window.title_format = "qutebrowser"

# colorscheme
config.source('gruvbox.py')
