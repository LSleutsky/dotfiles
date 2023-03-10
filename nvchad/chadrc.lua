local M = {}

M.ui = {
  theme = "catppuccin",
  theme_toggle = { "chadracula", "onedark" }
}
M.plugins = require "custom.plugins"
M.mappings = require "custom.mappings"

return M
