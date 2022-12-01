local wezterm = require 'wezterm'
local act = wezterm.action


return {
    default_cwd = "/home/leo",

    font = wezterm.font_with_fallback {
        'ComicCode',
        'Nerd Font',
    },

    font_size = 14,

    window_background_opacity = 0.9,

    inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.8,
    },

    hide_tab_bar_if_only_one_tab = true,
    use_fancy_tab_bar = false,
    tab_bar_at_bottom = true,


    colors = {
        -- The default text color
        foreground = '#fcfff4',
        -- The default background color
        background = '#000000',

        -- Overrides the cell background color when the current cell is occupied by the
        -- cursor and the cursor style is set to Block
        cursor_bg = '#89cff0',
        -- Overrides the text color when the current cell is occupied by the cursor
        cursor_fg = '#282c34',
        -- Specifies the border color of the cursor when the cursor style is set to Block,
        -- or the color of the vertical or horizontal bar when the cursor style is set to
        -- Bar or Underline.
        cursor_border = '#89cff0',

        -- the foreground color of selected text
        selection_fg = '#282c34',
        -- the background color of selected text
        selection_bg = '#89cff0',

        tab_bar = {
            -- The color of the strip that goes along the top of the window
            -- (does not apply when fancy tab bar is in use)
            background = '#89cff0',

            -- The active tab is the one that has focus in the window
            active_tab = {
                -- The color of the background area for the tab
                bg_color = '#89cff0',
                -- The color of the text for the tab
                fg_color = '#282c34',

                -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
                -- label shown for this tab.
                -- The default is "Normal"
                font = 'ComicCode',

                -- Specify whether you want "None", "Single" or "Double" underline for
                -- label shown for this tab.
                -- The default is "None"
                underline = 'None',

                -- Specify whether you want the text to be italic (true) or not (false)
                -- for this tab.  The default is false.
                italic = false,

                -- Specify whether you want the text to be rendered with strikethrough (true)
                -- or not for this tab.  The default is false.
                strikethrough = false,
            },

            -- Inactive tabs are the tabs that do not have focus
            inactive_tab = {
                bg_color = '#282c34',
                fg_color = '#fcfff4',

                -- The same options that were listed under the `active_tab` section above
                -- can also be used for `inactive_tab`.
            },

            -- You can configure some alternate styling when the mouse pointer
            -- moves over inactive tabs
            inactive_tab_hover = {
                bg_color = '#89cff0',
                fg_color = '#282c34',
                italic = true,

                -- The same options that were listed under the `active_tab` section above
                -- can also be used for `inactive_tab_hover`.
            },

            -- The new tab button that let you create new tabs
            new_tab = {
                bg_color = '#282c34',
                fg_color = '#fcfff4',

                -- The same options that were listed under the `active_tab` section above
                -- can also be used for `new_tab`.
            },

            -- You can configure some alternate styling when the mouse pointer
            -- moves over the new tab button
            new_tab_hover = {
                bg_color = '#3b3052',
                fg_color = '#909090',
                italic = true,

                -- The same options that were listed under the `active_tab` section above
                -- can also be used for `new_tab_hover`.
            },
        },
    },

    keys = {
        -- Create a new tab in the same domain as the current pane.
        -- This is usually what you want.
        {
            key = 'y',
            mods = 'SHIFT|CTRL',
            action = act.SpawnTab 'CurrentPaneDomain',
        },
        -- Create a new tab in the default domain
        { key = 't', mods = 'SHIFT|CTRL', action = act.SpawnTab 'DefaultDomain' },
        {
            key = 'w',
            mods = 'SHIFT|CTRL',
            action = wezterm.action.CloseCurrentTab { confirm = false },
        },
        { key = 'LeftArrow', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
        { key = 'RightArrow', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(1) },
        { key = 'h', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
        { key = 'l', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(1) },
    },
}
