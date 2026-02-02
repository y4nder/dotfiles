# ===============================
# qutebrowser Gruvbox config
# ===============================

# Load settings made via :set, :bind, etc.
config.load_autoconfig()

# -------------------------------
# Color palette (Gruvbox Dark)
# -------------------------------
bg0 = "#282828"
bg1 = "#3c3836"
bg2 = "#504945"
bg3 = "#665c54"

fg0 = "#ebdbb2"
fg1 = "#d5c4a1"

red    = "#cc241d"
green  = "#98971a"
yellow = "#d79921"
blue   = "#458588"
purple = "#b16286"
aqua   = "#689d6a"
gray   = "#928374"

# -------------------------------
# General UI
# -------------------------------
c.colors.webpage.bg = bg0
c.colors.webpage.preferred_color_scheme = "dark"

c.statusbar.show = "always"
c.tabs.show = "always"
c.tabs.position = "top"
c.tabs.padding = {"top": 6, "bottom": 6, "left": 8, "right": 8}
c.tabs.indicator.width = 0

# -------------------------------
# Statusbar
# -------------------------------
c.colors.statusbar.normal.bg = bg0
c.colors.statusbar.normal.fg = fg0

c.colors.statusbar.insert.bg = blue
c.colors.statusbar.insert.fg = bg0

c.colors.statusbar.command.bg = bg1
c.colors.statusbar.command.fg = fg0

c.colors.statusbar.caret.bg = purple
c.colors.statusbar.caret.fg = bg0

c.colors.statusbar.private.bg = bg2
c.colors.statusbar.private.fg = fg0

# -------------------------------
# Tabs
# -------------------------------
c.colors.tabs.bar.bg = bg0

c.colors.tabs.even.bg = bg1
c.colors.tabs.even.fg = fg1
c.colors.tabs.odd.bg = bg1
c.colors.tabs.odd.fg = fg1

c.colors.tabs.selected.even.bg = bg0
c.colors.tabs.selected.even.fg = yellow
c.colors.tabs.selected.odd.bg = bg0
c.colors.tabs.selected.odd.fg = yellow

c.colors.tabs.indicator.start = yellow
c.colors.tabs.indicator.stop = green

# -------------------------------
# Hints
# -------------------------------
c.colors.hints.bg = yellow
c.colors.hints.fg = bg0
c.colors.hints.match.fg = red

# -------------------------------
# Completion menu (compatible)
# -------------------------------
c.colors.completion.category.bg = bg1
c.colors.completion.category.fg = blue

c.colors.completion.even.bg = bg0
c.colors.completion.odd.bg = bg0

c.colors.completion.item.selected.bg = bg2
c.colors.completion.item.selected.fg = yellow

c.colors.completion.match.fg = aqua


# -------------------------------
# Messages
# -------------------------------
c.colors.messages.info.bg = bg1
c.colors.messages.info.fg = fg0

c.colors.messages.warning.bg = yellow
c.colors.messages.warning.fg = bg0

c.colors.messages.error.bg = red
c.colors.messages.error.fg = fg0

# -------------------------------
# Fonts (adjust if needed)
# -------------------------------
c.fonts.default_family = "JetBrainsMono Nerd Font"
c.fonts.default_size = "10pt"

# -------------------------------
# Search engines
# -------------------------------
c.url.searchengines = {
    "DEFAULT": "https://google.com/search?q={}",
    "g": "https://www.google.com/search?q={}",
    "gh": "https://github.com/search?q={}",
}

c.url.start_pages = ["https://google.com"]

# -------------------------------
# Privacy / behavior
# -------------------------------
c.content.blocking.method = "auto"
c.content.blocking.enabled = True
c.content.cookies.accept = "no-3rdparty"
c.content.javascript.clipboard = "access-paste"

# -------------------------------
# Keybindings (optional)
# -------------------------------
config.bind("M", "spawn mpv {url}")
config.bind("J", "tab-prev")
config.bind("K", "tab-next")
