---@meta
-------------------------------------------------------------------------------
-- OXWM Configuration File
-------------------------------------------------------------------------------
-- This is the default configuration for OXWM, a dynamic window manager.
-- Edit this file and reload with Mod+Shift+R (no compilation needed)
--
-- For more information about configuring OXWM, see the documentation.
-- The Lua Language Server provides autocomplete and type checking.
-------------------------------------------------------------------------------

---Load type definitions for LSP
---@module 'oxwm'

-------------------------------------------------------------------------------
-- Variables
-------------------------------------------------------------------------------
local modkey = "Mod4"
-- local terminal = "alacritty"
local terminal = "ghostty"

local colors = {
    fg = "#bbbbbb",
    -- red = "#f7768e",
    bg = "#121212",
    cyan = "#0db9d7",
    green = "#9ece6a",
    lavender = "#a9b1d6",
    light_blue = "#7aa2f7",
    grey = "#bbbbbb",
    blue = "#6dade3",
    purple = "#ad8ee6",

    -- Ashen
    black = "#121212",
    red = "#B14242",
    orange = "#D87C4A",
    yellow = "#E49A44",
    ashen_blue = "#4A8B8B",
    magenta = "#a7a7a7",
    -- cyan = "#b4b4b4",
    white = "#d5d5d5",
    dark_grey = "#555555",
    zero = "#000000",
}

-- local tags = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }
local tags = { "z", "a", "s", "d", "f", "g", "x", "c", "v" }
-- local tags = { "", "󰊯", "", "", "󰙯", "󱇤", "", "󱘶", "󰧮" } -- Example of nerd font icon tags

local bar_font = "JetBrainsMono Nerd Font Mono:style=Bold:size=10"

local blocks = {
    oxwm.bar.block.shell({
        format = "{}",
        command = "date +\"%a, %d %b - %-I:%M:%S\"",
        interval = 1,
        color = colors.ashen_blue,
    }),
};

oxwm.set_terminal(terminal)
oxwm.set_modkey(modkey) -- This is for Mod + mouse binds, such as drag/resize
oxwm.set_tags(tags)

oxwm.set_layout_symbol("tiling", "[T]")
oxwm.set_layout_symbol("normie", "[F]")

oxwm.border.set_width(1)
oxwm.border.set_focused_color(colors.dark_grey)
oxwm.border.set_unfocused_color(colors.zero)

oxwm.set_floating_position("center")

-- Smart Enabled = No border if 1 window
oxwm.gaps.set_smart(enabled)
-- Inner gaps (horizontal, vertical) in pixels
oxwm.gaps.set_inner(3, 3)
-- Outer gaps (horizontal, vertical) in pixels
oxwm.gaps.set_outer(3, 3)

oxwm.rule.add({ instance = "gimp", floating = true })
oxwm.rule.add({ class = "discord", tag = 9 })

oxwm.bar.set_font(bar_font)
oxwm.bar.set_blocks(blocks)

oxwm.bar.set_scheme_normal(colors.fg, colors.bg, "#444444") -- Parameters: foreground, background, border
oxwm.bar.set_scheme_occupied(colors.yellow, colors.bg, colors.yellow)
oxwm.bar.set_scheme_selected(colors.yellow, colors.bg, colors.yellow)
oxwm.bar.set_scheme_urgent(colors.red, colors.bg, colors.red)

-- Basic window management
oxwm.key.bind({ modkey }, "Return", oxwm.spawn_terminal())
oxwm.key.bind({ modkey }, "R", oxwm.spawn({ "sh", "-c", "rofi -show drun" }))
oxwm.key.bind({ modkey }, "E", oxwm.spawn("nemo"))
oxwm.key.bind({ modkey }, "W", oxwm.client.kill())

-- Media keys
oxwm.key.bind({}, "XF86AudioRaiseVolume", oxwm.spawn({ "wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+" }))
oxwm.key.bind({}, "XF86AudioLowerVolume", oxwm.spawn({ "wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-" }))

-- Copy screenshot to clipboard
oxwm.key.bind({ modkey }, "S", oxwm.spawn({ "sh", "-c", "maim -s | xclip -selection clipboard -t image/png" }))

-- Window state toggles
oxwm.key.bind({ modkey, "Shift" }, "F", oxwm.client.toggle_fullscreen())
oxwm.key.bind({ modkey, "Shift" }, "Return", oxwm.client.toggle_floating())

-- Layout management
oxwm.key.bind({ modkey }, "F", oxwm.layout.set("normie"))
oxwm.key.bind({ modkey }, "C", oxwm.layout.set("tiling"))
oxwm.key.bind({ modkey }, "N", oxwm.layout.cycle())

-- Decrease/Increase master area width
oxwm.key.bind({ modkey }, "H", oxwm.set_master_factor(-5))
oxwm.key.bind({ modkey }, "Left", oxwm.set_master_factor(-5))
oxwm.key.bind({ modkey }, "L", oxwm.set_master_factor(5))
oxwm.key.bind({ modkey }, "Right", oxwm.set_master_factor(5))

-- Enable tiled resize mode: Mod+RMB drag adjusts mfact instead of floating
oxwm.tiled_resize_mode(true)

-- Increment/Decrement number of master windows
oxwm.key.bind({ modkey }, "I", oxwm.inc_num_master(1))
oxwm.key.bind({ modkey }, "P", oxwm.inc_num_master(-1))

-- Gaps toggle
oxwm.key.bind({ modkey }, "A", oxwm.toggle_gaps())

-- Bar toggle
oxwm.key.bind({ modkey }, "B", oxwm.toggle_bar())

-- Window manager controls
oxwm.key.bind({ modkey, "Shift" }, "Q", oxwm.quit())
oxwm.key.bind({ modkey, "Shift" }, "R", oxwm.restart())

-- Focus movement [1 for up in the stack, -1 for down]
oxwm.key.bind({ modkey }, "J", oxwm.client.focus_stack(1))
oxwm.key.bind({ modkey, "Shift" }, "Left", oxwm.client.focus_stack(1))
oxwm.key.bind({ modkey }, "K", oxwm.client.focus_stack(-1))
oxwm.key.bind({ modkey, "Shift" }, "Right", oxwm.client.focus_stack(-1))

-- Window movement (swap position in stack)
oxwm.key.bind({ modkey, "Shift" }, "J", oxwm.client.move_stack(1))
oxwm.key.bind({ modkey, "Shift", "Control" }, "Right", oxwm.client.move_stack(1))
oxwm.key.bind({ modkey, "Shift" }, "K", oxwm.client.move_stack(-1))
oxwm.key.bind({ modkey, "Shift", "Control" }, "Left", oxwm.client.move_stack(-1))

-- Focus next/previous Monitors
oxwm.key.bind({ modkey }, "Comma", oxwm.monitor.focus(-1))
oxwm.key.bind({ modkey }, "Period", oxwm.monitor.focus(1))
-- Move window to next/previous Monitors
oxwm.key.bind({ modkey, "Shift" }, "Comma", oxwm.monitor.tag(-1))
oxwm.key.bind({ modkey, "Shift" }, "Period", oxwm.monitor.tag(1))

-- Workspace (tag) navigation
-- Switch to workspace N (tags are 0-indexed, so tag "1" is index 0)
oxwm.key.bind({ modkey }, "1", oxwm.tag.view(0))
oxwm.key.bind({ modkey }, "2", oxwm.tag.view(1))
-- Mod+3: vai para a tag 3 e abre o helium se ele não estiver rodando
-- (o script usa o bind auxiliar Mod+F3 abaixo para trocar de tag)
oxwm.key.bind({ modkey }, "3", oxwm.spawn({ "sh", "-c", "~/.config/oxwm/scripts/browser.sh" }))
oxwm.key.bind({ modkey }, "F3", oxwm.tag.view(2))
oxwm.key.bind({ modkey }, "4", oxwm.tag.view(3))
oxwm.key.bind({ modkey }, "5", oxwm.tag.view(4))
oxwm.key.bind({ modkey }, "6", oxwm.tag.view(5))
oxwm.key.bind({ modkey }, "7", oxwm.tag.view(6))
oxwm.key.bind({ modkey }, "8", oxwm.tag.view(7))
oxwm.key.bind({ modkey }, "9", oxwm.tag.view(8))

-- Move focused window to workspace N
oxwm.key.bind({ modkey, "Shift" }, "1", oxwm.tag.move_to(0))
oxwm.key.bind({ modkey, "Shift" }, "2", oxwm.tag.move_to(1))
oxwm.key.bind({ modkey, "Shift" }, "3", oxwm.tag.move_to(2))
oxwm.key.bind({ modkey, "Shift" }, "4", oxwm.tag.move_to(3))
oxwm.key.bind({ modkey, "Shift" }, "5", oxwm.tag.move_to(4))
oxwm.key.bind({ modkey, "Shift" }, "6", oxwm.tag.move_to(5))
oxwm.key.bind({ modkey, "Shift" }, "7", oxwm.tag.move_to(6))
oxwm.key.bind({ modkey, "Shift" }, "8", oxwm.tag.move_to(7))
oxwm.key.bind({ modkey, "Shift" }, "9", oxwm.tag.move_to(8))

-- Combo view (view multiple tags at once) {argos_nothing}
-- Example: Mod+Ctrl+2 while on tag 1 will show BOTH tags 1 and 2
oxwm.key.bind({ modkey, "Control" }, "1", oxwm.tag.toggleview(0))
oxwm.key.bind({ modkey, "Control" }, "2", oxwm.tag.toggleview(1))
oxwm.key.bind({ modkey, "Control" }, "3", oxwm.tag.toggleview(2))
oxwm.key.bind({ modkey, "Control" }, "4", oxwm.tag.toggleview(3))
oxwm.key.bind({ modkey, "Control" }, "5", oxwm.tag.toggleview(4))
oxwm.key.bind({ modkey, "Control" }, "6", oxwm.tag.toggleview(5))
oxwm.key.bind({ modkey, "Control" }, "7", oxwm.tag.toggleview(6))
oxwm.key.bind({ modkey, "Control" }, "8", oxwm.tag.toggleview(7))
oxwm.key.bind({ modkey, "Control" }, "9", oxwm.tag.toggleview(8))

-- Multi tag (window on multiple tags)
-- Example: Mod+Ctrl+Shift+2 puts focused window on BOTH current tag and tag 2
oxwm.key.bind({ modkey, "Control", "Shift" }, "1", oxwm.tag.toggletag(0))
oxwm.key.bind({ modkey, "Control", "Shift" }, "2", oxwm.tag.toggletag(1))
oxwm.key.bind({ modkey, "Control", "Shift" }, "3", oxwm.tag.toggletag(2))
oxwm.key.bind({ modkey, "Control", "Shift" }, "4", oxwm.tag.toggletag(3))
oxwm.key.bind({ modkey, "Control", "Shift" }, "5", oxwm.tag.toggletag(4))
oxwm.key.bind({ modkey, "Control", "Shift" }, "6", oxwm.tag.toggletag(5))
oxwm.key.bind({ modkey, "Control", "Shift" }, "7", oxwm.tag.toggletag(6))
oxwm.key.bind({ modkey, "Control", "Shift" }, "8", oxwm.tag.toggletag(7))
oxwm.key.bind({ modkey, "Control", "Shift" }, "9", oxwm.tag.toggletag(8))

-------------------------------------------------------------------------------
-- Advanced: Keychords
-------------------------------------------------------------------------------
-- Keychords allow you to bind multiple-key sequences (like Emacs or Vim)
-- Format: {{modifiers}, key1}, {{modifiers}, key2}, ...
-- Example: Press Mod4+Space, then release and press T to spawn a terminal
oxwm.key.chord({
    { { modkey }, "T" },
    { {},         "T" }
}, oxwm.spawn_terminal())

-------------------------------------------------------------------------------
-- Autostart
-------------------------------------------------------------------------------
oxwm.autostart("/usr/bin/csd-xsettings")
oxwm.autostart("/usr/libexec/polkit-mate-authentication-agent-1")
oxwm.autostart("unclutter")
oxwm.autostart("picom")
oxwm.autostart("feh --bg-fill /home/heitor/Imagens/wall1.jpg")
