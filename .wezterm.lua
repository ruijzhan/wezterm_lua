-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 11
config.color_scheme = ''

config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = true
-- Custom key bindings for tab switching
local act = wezterm.action

config.keys = {}

-- Ctrl+1 through Ctrl+9 to switch to tab 1-9
for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'CTRL',
    action = act.ActivateTab(i - 1),  -- tab index starts at 0
  })
  -- Disable default Ctrl+Shift+number bindings
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'CTRL|SHIFT',
    action = act.DisableDefaultAssignment,
  })
end

-- Ctrl+Left/Right to switch to previous/next tab
table.insert(config.keys, {
  key = 'LeftArrow',
  mods = 'CTRL',
  action = act.ActivateTabRelative(-1),
})
table.insert(config.keys, {
  key = 'RightArrow',
  mods = 'CTRL',
  action = act.ActivateTabRelative(1),
})

-- F3/F4 to switch to previous/next tab
table.insert(config.keys, {
  key = 'F3',
  mods = 'NONE',
  action = act.ActivateTabRelative(-1),
})
table.insert(config.keys, {
  key = 'F4',
  mods = 'NONE',
  action = act.ActivateTabRelative(1),
})


-- Set default program if Git Bash exists (check D: then C:)
-- Only check on Windows
if wezterm.target_triple:find('windows') then
  for _, path in ipairs({ 'D:/Program Files/Git/bin/bash.exe', 'C:/Program Files/Git/bin/bash.exe' }) do
    local f = io.open(path, 'r')
    if f then f:close(); config.default_prog = { path, '-l' }; break end
  end
end

-- Finally, return the configuration to wezterm:
return config
