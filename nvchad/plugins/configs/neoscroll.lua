local present, neoscroll = pcall(require, "neoscroll")

if not present then
  return
end

neoscroll.setup({
  mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', 'zt', 'zz', 'zb'},
  hide_cursor = false,
  performance_mode = false,
  respect_scrolloff = false,
  stop_eof = true
})
