local M = {}

M.barbar = {
  n = {
    ["<TAB>"] = {":BufferNext <CR>", "go to next buffer"},
    ["<S-TAB>"] = {":BufferPrevious <CR>", "go to previous buffer"},
    ["<S-q>"] = {":BufferClose <CR>", "close current buffer"},
    ["<Space>1"] = {":BufferGoto 1 <CR>", "go to buffer 1"},
    ["<Space>2"] = {":BufferGoto 2 <CR>", "go to buffer 2"},
    ["<Space>3"] = {":BufferGoto 3 <CR>", "go to buffer 3"},
    ["<Space>4"] = {":BufferGoto 4 <CR>", "go to buffer 4"},
    ["<Space>5"] = {":BufferGoto 5 <CR>", "go to buffer 5"},
    ["<Space>6"] = {":BufferGoto 6 <CR>", "go to buffer 6"},
    ["<Space>7"] = {":BufferGoto 7 <CR>", "go to buffer 7"},
    ["<Space>8"] = {":BufferGoto 8 <CR>", "go to buffer 8"},
    ["<Space>9"] = {":BufferGoto 9 <CR>", "go to buffer 9"}
  }
}

M.commentbox = {
 n = {
    ["<leader>ac"] = {"<cmd> lua require('comment-box').lbox() <CR>", "comment box"}
  }
}

M.nvimtree = {
  n = {
    ["<C-e>"] = {"<cmd> NvimTreeToggle <CR>", "toggle nvimtree"}
  }
}

M.custom = {
  i = {
    ["<C-s>"] = {"<ESC> :w <CR>"},
    ["<C-S-s>"] = {"<ESC> :wa <CR>", "save all"}
  },

  n = {
    ["J"] = {":move .+1 <CR>==", "move selected text down"},
    ["K"] = {":move .-2 <CR>==", "move selected text up"},
    ["x"] = {'"_x', "don't yank deleted character"},
    ["X"] = {'"_X', "don't yank deleted character"},
    ["<leader>w"] = {":bw <CR>", "wipe out buffer"},
    ["<C-S-s>"] = {":wa <CR>", "save all"}
  },

  v = {
    ["x"] = {'"_x', "don't yank deleted character"},
    ["X"] = {'"_X', "don't yank deleted character"}
  }
}

return M

