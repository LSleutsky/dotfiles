local M = {}

M.barbar = {
  n = {
    ["<TAB>"] = {"<cmd> BufferNext <CR>", "go to next buffer"},
    ["<S-TAB>"] = {"<cmd> BufferPrevious <CR>", "go to previous buffer"},
    ["<S-q>"] = {"<cmd> BufferClose <CR>", "close current buffer"},
    ["<Space>1"] = {"<cmd> BufferGoto 1 <CR>", "go to buffer 1"},
    ["<Space>2"] = {"<cmd> BufferGoto 2 <CR>", "go to buffer 2"},
    ["<Space>3"] = {"<cmd> BufferGoto 3 <CR>", "go to buffer 3"},
    ["<Space>4"] = {"<cmd> BufferGoto 4 <CR>", "go to buffer 4"},
    ["<Space>5"] = {"<cmd> BufferGoto 5 <CR>", "go to buffer 5"},
    ["<Space>6"] = {"<cmd> BufferGoto 6 <CR>", "go to buffer 6"},
    ["<Space>7"] = {"<cmd> BufferGoto 7 <CR>", "go to buffer 7"},
    ["<Space>8"] = {"<cmd> BufferGoto 8 <CR>", "go to buffer 8"},
    ["<Space>9"] = {"<cmd> BufferGoto 9 <CR>", "go to buffer 9"},
    ["`"] = {"<cmd> BufferMoveNext <CR>", "move buffer right"},
    ["<C-`>"] = {"<cmd> BufferMovePrevious <CR>", "move buffer left"}
  }
}

M.commentbox = {
 n = {
    ["<leader>cx"] = {"<cmd> CBlbox <CR>", 'comment box'},
    ["<leader>cl"] = {"<cmd> CBline <CR>", 'comment line'}
  }
}

M.lsp = {
 n = {
    ["<leader>rn"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "lsp rename"
    },
    ["<leader>ca"] = {"<cmd> lua vim.lsp.buf.code_action() <CR>", "lsp code actions"},
    ["<leader>f"] = {"<cmd> lua vim.lsp.buf.format({ timeout_ms = 5000 }) <CR>", "format document"}
  }
}

M.markdownpreview = {
  n = {
    ["<C-p>"] = {"<cmd> MarkdownPreviewToggle <CR>", "toggle markdown preview"}
  }
}

M.mru = {
  n = {
    ["<leader>m"] = {"<cmd> MRU <CR>", "most recently used"}
  }
}

M.nvimtree = {
  n = {
    ["<C-e>"] = {"<cmd> NvimTreeToggle <CR>", "toggle nvimtree"}
  }
}

M.telescope = {
  n = {
    ["<leader>fs"] = {"<cmd> Telescope live_grep <CR>", "live grep"},
    ["<leader>fw"] = {"<cmd> Telescope grep_string <CR>", "grep word under cursor"},
    ["<leader>cb"] = {"<cmd> Telescope git_bcommits <CR>", "buffer git commits"}
  }
}

M.trouble = {
  n = {
    ["<leader>t"] = {"<cmd> TroubleToggle <CR>", "toggle trouble"}
  }
}

M.custom = {
  i = {
    ["<C-s>"] = {"<ESC> <cmd> w <CR>", "save"},
    ["<C-S-s>"] = {"<ESC> <cmd> wa <CR>", "save all"}
  },

  n = {
    ["<S-up>"] = {"<cmd> m-2 <CR>==", "move selected text up"},
    ["<S-down>"] = {"<cmd> m+ <CR>==", "move selected text down"},
    ["x"] = {'"_x', "don't yank deleted character"},
    ["X"] = {'"_X', "don't yank deleted character"},
    ["<leader>w"] = {"<cmd> bw <CR>", "wipe out buffer"},
    ["<C-a>"] = {"gg0VG", "select all text"},
    ["<C-x>"] = {"<C-w>c", "close window"},
    ["<C-S-s>"] = {"<cmd> wa <CR>", "save all"},
    ["<leader>fp"] = {"<cmd> !echo -n % | pbcopy <CR>", "copy file path"},
    ["<F5>"] = {"<cmd> bufdo e <CR>", "reload open buffers"},
    ["-"] = {"<cmd> qa <CR>", "exit neovim"}
  },

  v = {
    ["x"] = {'"_x', "don't yank deleted character"},
    ["X"] = {'"_X', "don't yank deleted character"}
  }
}

return M
