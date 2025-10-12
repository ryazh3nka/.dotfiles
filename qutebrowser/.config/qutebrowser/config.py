config.load_autoconfig()

config.bind('td', 'config-cycle colors.webpage.darkmode.enabled true false')
c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.bg = '#282828'

c.fonts.default_family = 'UbuntuMono Nerd Font'
c.fonts.default_size = "18pt"

c.url.start_pages = ["~/.config/qutebrowser/startpage.html"]
c.url.searchengines = {
    'DEFAULT':  'https://google.com/search?hl=en&q={}',
}

c.window.title_format = "qutebrowser"

config.source('qutemacs.py') # keybinds
config.source('gruvbox.py') # colorscheme
