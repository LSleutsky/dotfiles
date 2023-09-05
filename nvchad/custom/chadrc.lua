local M = {}
local highlights = require("custom.highlights")
local overrides = require("custom.overrides")

M.ui = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "catppuccin" },
  hl_override = highlights.override,
  hl_add = highlights.add,
  extended_integrations = { "navic" },
  changed_themes = {
    catppuccin = {
      base_16 = {
        base00 = "#181825",
        base01 = "#1e1e2e",
        base02 = "#313244",
        base03 = "#45475a",
        base04 = "#6c7086",
        base05 = "#cdd6f4",
        base06 = "#a6adc8",
        base07 = "#bac2de",
        base08 = "#f38ba8",
        base09 = "#fab387",
        base0A = "#f9e2af",
        base0B = "#a6e3a1",
        base0C = "#89dceb",
        base0D = "#89b4fa",
        base0E = "#cba6f7",
        base0F = "#f38ba8",
      },
      base_30 = {
        white = "#cdd6f4",
        darker_black = "#11111b",
        black = "#181825", --  nvim bg
        black3 = "#1e1e2e",
        one_bg = "#313244", -- real bg of onedark
        one_bg3 = "#45475a",
        one_bg4 = "#585b70",
        grey = "#45475a",
        grey_fg = "#585b70",
        grey_fg3 = "#6c7086",
        light_grey = "#7f849c",
        red = "#f38ba8",
        baby_pink = "#eba0ac",
        pink = "#f5c2e7",
        line = "#9399b2", -- for lines like vertsplit
        green = "#a6e3a1",
        vibrant_green = "#a6e3a1",
        nord_blue = "#74c7ec",
        blue = "#89b4fa",
        yellow = "#f9e2af",
        sun = "#fab387",
        purple = "#cba6f7",
        dark_purple = "#cba6f7",
        teal = "#94e2d5",
        orange = "#fab387",
        cyan = "#89dceb",
        statusline_bg = "#313244",
        lightbg = "#313244",
        pmenu_bg = "#bac2de",
        folder_bg = "#89b4fa",
        lavender = "#b4befe",
      }
    }
  },
  statusline = {
    overriden_modules = function(modules)
      local statusline = require("nvchad.statusline.vscode_colored")
      local function navic_statusline()
        local navic = require("nvim-navic")

        if navic.is_available() then
          return navic.get_location()
        else
          return " "
        end
      end

      modules[3] = (function()
        return "%#St_gitIcons#" .. statusline.git() .. overrides.gitchanges()
      end)()

      table.insert(modules, 6, " " .. navic_statusline() .. " ")
      table.insert(modules, 12, "| %l:%c ")
    end
  },
  tabufline = {
    lazyload = false
  }
}

M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M
