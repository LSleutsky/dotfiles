local present, code_window = pcall(require, "codewindow")

if not present then
  return
end

code_window.setup({
  active_in_terminals = false,
  auto_enable = {
    "javascript",
    "javascriptreact"
  },
  exclude_filetypes = {
    "NvimTree"
  },
  max_minimap_height = nil,
  max_lines = nil,
  minimap_width = 15,
  use_lsp = true,
  use_treesitter = true,
  use_git = true,
  width_multiplier = 4,
  z_index = 1,
  show_cursor = true,
  window_border = "single"
})

code_window.apply_default_keybinds()
