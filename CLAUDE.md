# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a WezTerm terminal emulator configuration using Lua. WezTerm is a GPU-accelerated terminal emulator and multiplexer written in Rust, with configuration expressed in Lua.

## Configuration File

The main configuration is in `.wezterm.lua` at the repository root. WezTerm automatically loads this file from:
- Linux/macOS: `~/.wezterm.lua`
- Windows: `%USERPROFILE%\.wezterm.lua`

### Configuration Architecture

WezTerm uses a specific pattern for configuration:

```lua
local wezterm = require 'wezterm'
local config = wezterm.config_builder()
-- ... configuration options ...
return config
```

The `config_builder()` creates a builder object with all default values pre-filled, allowing you to override only what you need.

## Applying Configuration Changes

- **Reload configuration**: Press `Ctrl+Shift+R` in WezTerm to reload the config without restarting
- **Edit and reload**: Edit `.wezterm.lua`, then press `Ctrl+Shift+R` to apply changes
- **Verify config**: WezTerm will show config errors in a popup on startup or reload

## Common Configuration Areas

- `initial_cols`, `initial_rows`: Default window geometry
- `font_size`: Font size in points
- `color_scheme`: Built-in color scheme (run `wezterm ls colors` to see all available)
- `font`: Custom font configuration
- `keys`: Key bindings and assignments
- `mouse_bindings`: Mouse button assignments
- `launch_menu`: Programs that appear when creating new tabs

## WezTerm Command Reference

- `wezterm ls colors`: List all available color schemes
- `wezterm cli`: Command-line interface for interacting with running WezTerm instances
- `wezterm show-keys`: Show key bindings
- `wezterm imgcat`: Display images in the terminal

## Lua Patterns

- Use `require 'wezterm'` to access the WezTerm API
- Configuration uses key-value assignment: `config.option = value`
- Event callbacks use `wezterm.on()` for hooks like `window-config-reloaded`
- Helper functions available in `wezterm.action` for key binding actions

## Documentation Reference

A comprehensive list of WezTerm configuration options and their documentation links is available in `wezterm_config_links.md`.

When working with WezTerm configuration:
1. **Look up config options**: Check `wezterm_config_links.md` for the exact option name and documentation link
2. **Find examples**: Each link points to the official WezTerm documentation with usage examples
3. **Explore categories**: The file is organized by categories (appearance, fonts, key bindings, etc.)

Key sections in `wezterm_config_links.md`:
- **Config Options**: 200+ configuration options with direct documentation links
- **Lua API Reference**: wezterm module functions, event handlers, and objects
- **Key Assignments**: Complete list of key binding actions
- **Window Events**: Events like `format-window-title`, `update-right-status`, etc.

Usage pattern:
```lua
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Look up option in wezterm_config_links.md if unsure
config.font_size = 12
config.color_scheme = 'Tokyo Night'

return config
```
