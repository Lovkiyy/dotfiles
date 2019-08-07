# Cache around 30 megs
c.content.cache.size = 30000000
c.content.webgl = False
c.content.geolocation = False
c.content.autoplay = False
c.content.canvas_reading = False
c.content.notifications = False
# It is the default but i want to make it explicit
c.content.javascript.can_access_clipboard = False

c.downloads.location.directory = "$HOME/tmp"
c.downloads.remove_finished = 60

c.completion.height = "45%"
c.completion.open_categories = ['bookmarks', 'history', 'quickmarks', 'searchengines']

c.aliases = {'w': 'session-save',
        'wq': 'quit --save',
        'q': 'close',
        'qa': 'quit',
        'cs': 'config-source'}

c.editor.command = ['st', '-e', 'nvim', '{}']

c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}',
    'aw': 'https://wiki.archlinux.org/?search={}',
    'i': 'https://yandex.ru/images/search?text={}',
    'w': 'https://en.wikipedia.org/w/index.php?search={}',
    'wru': 'https://ru.wikipedia.org/w/index.php?search={}',
    'gh': 'https://github.com/search?q={}',
    'j': 'https://jisho.org/search/{}',
    'ya': 'https://yandex.ru/search/?text={}',
    'yama': 'https://market.yandex.ru/search?text={}&local-offers-first=1',
    'a': 'https://myanimelist.net/search/all?q={}'}

c.bindings.commands = {
        'insert': {
            #'<Ctrl-f>'        : 'fake-key <Right>',
            '<Ctrl-b>'        : 'fake-key <Left>',
            '<Ctrl-s>'        : 'fake-key <Home>',
            '<Ctrl-e>'        : 'fake-key <End>',
            '<Alt-v>'         : 'fake-key <PgUp>',
            '<Ctrl-v>'        : 'fake-key <PgDown>',
            '<Ctrl-n>'        : 'fake-key <Down>',
            '<Ctrl-p>'        : 'fake-key <Up>',
            '<Alt-f>'         : 'fake-key <Ctrl-Right>',
            '<Alt-b>'         : 'fake-key <Ctrl-Left>',
            '<Ctrl-d>'        : 'fake-key <Delete>',
            '<Alt-d>'         : 'fake-key <Ctrl-Delete>',
            '<Ctrl-w>'        : 'fake-key <Ctrl-Backspace>',
            # Default was that command was <Ctrl-e>
            '<Ctrl-Shift-e>'  : 'open-editor',
            }
        }

c.content.user_stylesheets = ["$XDG_CONFIG_HOME/qutebrowser/solarized-dark-all.css"]
# Toggle stylesheet
config.bind(',n','config-cycle content.user_stylesheets ~/.config/qutebrowser/solarized-dark-all.css ""')

# Toggle socks proxy via tor
config.bind(',t','config-cycle content.proxy system socks://localhost:9050')

# Download bindings
config.unbind(';d')
config.bind(';di','hint images download')
config.bind(';dl','hint links download')
config.bind('gd','download --mhtml')

# Fonts settings
c.fonts.web.family.serif = "M+ 1p"
c.fonts.monospace = "UbuntuMono Nerd Font"
c.fonts.completion.category = "bold 13pt monospace"
c.fonts.completion.entry = "13pt monospace"
c.fonts.debug_console = "13pt monospace"
c.fonts.downloads = "13pt monospace"
c.fonts.hints = "13pt monospace"
c.fonts.keyhint = "13pt monospace"
c.fonts.messages.error = "13pt monospace"
c.fonts.messages.info = "13pt monospace"
c.fonts.messages.warning = "13pt monospace"
c.fonts.prompts = "13pt monospace"
c.fonts.statusbar = "13pt monospace"
c.fonts.tabs = "13pt monospace"

# i am still waiting for it
#config.set('content.user_stylesheets', [], '*://github.com')

############## Solarized color scheme ###############
#####################################################
#####################################################

solarized = {
    'base03': '#002b36',
    'base02': '#073642',
    'base01': '#586e75',
    'base00': '#657b83',
    'base0': '#839496',
    'base1': '#93a1a1',
    'base2': '#eee8d5',
    'base3': '#fdf6e3',
    'yellow': '#b58900',
    'orange': '#cb4b16',
    'red': '#dc322f',
    'magenta': '#d33682',
    'violet': '#6c71c4',
    'blue': '#268bd2',
    'cyan': '#2aa198',
    'green': '#859900'
}

c.colors.completion.category.bg = solarized['base03']
c.colors.completion.category.border.bottom = solarized['base03']
c.colors.completion.category.border.top = solarized['base03']
c.colors.completion.category.fg = solarized['base3']
c.colors.completion.even.bg = solarized['base02']
c.colors.completion.fg = solarized['base1']
c.colors.completion.item.selected.bg = solarized['violet']
c.colors.completion.item.selected.border.bottom = solarized['violet']
c.colors.completion.item.selected.border.top = solarized['violet']
c.colors.completion.item.selected.fg = solarized['base3']
c.colors.completion.match.fg = solarized['base2']
c.colors.completion.odd.bg = solarized['base02']
c.colors.completion.scrollbar.bg = solarized['base1']
c.colors.completion.scrollbar.fg = solarized['base2']
c.colors.downloads.bar.bg = solarized['base03']
c.colors.downloads.error.bg = solarized['red']
c.colors.downloads.error.fg = solarized['base3']
c.colors.downloads.start.fg = solarized['base3']
c.colors.hints.bg = solarized['violet']
c.colors.hints.fg = solarized['base3']
c.colors.hints.match.fg = solarized['base1']
c.colors.keyhint.fg = solarized['base3']
c.colors.keyhint.suffix.fg = solarized['yellow']
c.colors.messages.error.bg = solarized['red']
c.colors.messages.error.border = solarized['red']
c.colors.messages.error.fg = solarized['base3']
c.colors.messages.info.bg = solarized['base03']
c.colors.messages.info.border = solarized['base03']
c.colors.messages.info.fg = solarized['base3']
c.colors.messages.warning.bg = solarized['orange']
c.colors.messages.warning.border = solarized['orange']
c.colors.messages.warning.fg = solarized['base3']
c.colors.prompts.bg = solarized['base02']
c.colors.prompts.border = '1px solid ' + solarized['base3']
c.colors.prompts.fg = solarized['base3']
c.colors.prompts.selected.bg = solarized['base01']
c.colors.statusbar.caret.bg = solarized['blue']
c.colors.statusbar.caret.fg = solarized['base1']
c.colors.statusbar.caret.selection.bg = solarized['violet']
c.colors.statusbar.caret.selection.fg = solarized['base1']
c.colors.statusbar.command.bg = solarized['base03']
c.colors.statusbar.command.fg = solarized['base1']
c.colors.statusbar.command.private.bg = solarized['base01']
c.colors.statusbar.command.private.fg = solarized['base3']
c.colors.statusbar.insert.bg = solarized['base02']
c.colors.statusbar.insert.fg = solarized['base1']
c.colors.statusbar.normal.bg = solarized['base03']
c.colors.statusbar.normal.fg = solarized['base1']
c.colors.statusbar.passthrough.bg = solarized['base02']
c.colors.statusbar.passthrough.fg = solarized['base1']
c.colors.statusbar.private.bg = solarized['base01']
c.colors.statusbar.private.fg = solarized['base3']
c.colors.statusbar.progress.bg = solarized['base1']
c.colors.statusbar.url.error.fg = solarized['red']
c.colors.statusbar.url.fg = solarized['base1']
c.colors.statusbar.url.hover.fg = solarized['base2']
c.colors.statusbar.url.success.http.fg = solarized['magenta']
c.colors.statusbar.url.success.https.fg = solarized['base1']
c.colors.statusbar.url.warn.fg = solarized['yellow']
c.colors.tabs.even.bg = solarized['base02']
c.colors.tabs.even.fg = solarized['base1']
c.colors.tabs.indicator.error = solarized['red']
c.colors.tabs.indicator.start = solarized['violet']
c.colors.tabs.indicator.stop = solarized['orange']
c.colors.tabs.odd.bg = solarized['base03']
c.colors.tabs.odd.fg = solarized['base1']
c.colors.tabs.selected.even.bg = solarized['violet']
c.colors.tabs.selected.even.fg = solarized['base2']
c.colors.tabs.selected.odd.bg = solarized['violet']
c.colors.tabs.selected.odd.fg = solarized['base2']
