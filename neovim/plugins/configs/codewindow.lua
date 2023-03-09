local present, code_window = pcall(require, "codewindow")

if not present then
  return
end

code_window.setup({
  active_in_terminals = false,
  auto_enable = {
    "javascript",
    "javascriptreact",
    "lua",
    "yaml",
    "yml"
  },
  exclude_filetypes = {
    "NvimTree",
    "Trouble",
    "Alpha"
  },
  max_minimap_height = nil,
  max_lines = nil,
  minimap_width = 15,
  use_lsp = true,
  use_treesitter = true,
  use_git = true,
  width_multiplier = 4,
  z_index = 1,
  show_cursor = false,
  window_border = "none"
})

code_window.apply_default_keybinds()
