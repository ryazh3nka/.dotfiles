import everforest
everforest.set(c, 'dark', 'hard')

config.load_autoconfig()
config.source('everforest.py')

#config.set('colors.webpage.preferred_color_scheme', 'dark')
config.bind('td', 'config-cycle colors.webpage.darkmode.enabled true false')

c.fonts.default_family = 'UbuntuMono Nerd Font'
c.fonts.default_size = "18pt"
c.url.start_pages = ["~/.config/qutebrowser/startpage.html"]

c.url.searchengines = {
    'DEFAULT':  'https://google.com/search?hl=en&q={}',
}
