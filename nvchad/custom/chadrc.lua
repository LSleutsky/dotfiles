---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "decay",
  theme_toggle = { "decay", "catppuccin" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  extended_integrations = { "navic" },
  statusline = {
    overriden_modules = function(modules)
      local function navic_statusline()
        local navic = require("nvim-navic")

        if navic.is_available() then
          return navic.get_location()
        else
          return " "
        end
      end

      table.insert(modules, 6, navic_statusline())
      table.insert(modules, 12, "| Ln %l, Col %c")
    end
  }
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
