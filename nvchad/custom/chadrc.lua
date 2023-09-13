local M = {}
local highlights = require("custom.highlights")
local overrides = require("custom.overrides")

M.ui = {
  theme = "tokyonight",
  theme_toggle = { "tokyonight", "decay" },
  hl_override = highlights.override,
  hl_add = highlights.add,
  extended_integrations = { "navic" },
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
