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
    ["<leader>cb"] = {"<cmd> CBlbox <CR>", 'comment box'},
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
    ["<leader>cf"] = {"<cmd> lua vim.lsp.buf.format() <CR>", "format document"}
  }
}

M.markdownpreview = {
  n = {
    ["<C-p>"] = {"<cmd> MarkdownPreviewToggle <CR>", "toggle markdown preview"}
  }
}

M.nvimtree = {
  n = {
    ["<C-e>"] = {"<cmd> NvimTreeToggle <CR>", "toggle nvimtree"}
  }
}

M.sessionmanager = {
  n = {
    ["<leader>ss"] = {"<cmd> SessionManager save_current_session <CR>"},
    ["<leader>sd"] = {"<cmd> SessionManager load_current_dir_session <CR>"},
    ["<leader>sr"] = {"<cmd> SessionManager delete_session <CR>"},
  }
}

M.telescope = {
  n = {
    ["<leader>fs"] = {"<cmd> Telescope live_grep <CR>", "live grep"},
    ["<leader>fw"] = {"<cmd> Telescope grep_string <CR>", "grep word under cursor"},
  }
}

M.custom = {
  i = {
    ["<C-s>"] = {"<ESC> :w <CR>", "save"},
    ["<C-S-s>"] = {"<ESC> :wa <CR>", "save all"}
  },

  n = {
    ["J"] = {"<cmd> move .+1 <CR>==", "move selected text down"},
    ["K"] = {"<cmd> move .-2 <CR>==", "move selected text up"},
    ["x"] = {'"_x', "don't yank deleted character"},
    ["X"] = {'"_X', "don't yank deleted character"},
    ["<leader>w"] = {":bw <CR>", "wipe out buffer"},
    ["<C-a>"] = {"gg0VG", "select all text"},
    ["<C-x>"] = {"<C-w>c", "close window"},
    ["<C-S-s>"] = {":wa <CR>", "save all"},
    ["<Space>fp"] = {"<cmd> !echo -n % | pbcopy <CR>", "copy file path"}
  },

  v = {
    ["x"] = {'"_x', "don't yank deleted character"},
    ["X"] = {'"_X', "don't yank deleted character"}
  }
}

return M
