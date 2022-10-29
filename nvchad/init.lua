local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt
-- general settings
opt.relativenumber = true

-- auto commands
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 250 })
  end
})

autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd ="
})
