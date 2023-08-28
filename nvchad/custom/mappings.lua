---@type MappingsTable
local M = {}

M.general = {
  i = {
    ["<C-s>"] = {"<ESC> <cmd> w <CR>", "Save"},
    ["<C-S-s>"] = {"<ESC> <cmd> wa <CR>", "Save all"}
  },

  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<S-up>"] = {"<cmd> m-2 <CR>==", "Move selected text up"},
    ["<S-down>"] = {"<cmd> m+ <CR>==", "Move selected text down"},
    ["x"] = {'"_x', "Don't yank deleted char"},
    ["X"] = {'"_X', "Don't yank deleted char"},
    ["<leader>w"] = {"<cmd> bw <CR>", "Wipe out buffer"},
    ["<C-a>"] = {"gg0VG", "Select all text"},
    ["<C-x>"] = {"<C-w>c", "Close window"},
    ["<C-S-s>"] = {"<cmd> wa <CR>", "Save all"},
    ["<leader>fp"] = {"<cmd> !echo -n % | pbcopy <CR>", "Copy file path"},
    ["<F5>"] = {"<cmd> bufdo e <CR>", "Reload open buffers"},
    ["-"] = {"<cmd> qa <CR>", "Exit neovim"}
  },

  v = {
    ["x"] = {'"_x', "Don't yank deleted char"},
    ["X"] = {'"_X', "Don't yank deleted char"}
  }
}

M.commentbox = {
 n = {
    ["<leader>cx"] = {"<cmd> CBlbox <CR>", 'Comment box'},
    ["<leader>cl"] = {"<cmd> CBline <CR>", 'Comment line'}
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
    ["<leader>ca"] = {"<cmd> lua vim.lsp.buf.code_action() <CR>", "LSP code actions"},
    ["<leader>f"] = {"<cmd> lua vim.lsp.buf.format({ timeout_ms = 5000 }) <CR>", "Format document"}
  }
}

M.markdownpreview = {
  n = {
    ["<C-p>"] = {"<cmd> MarkdownPreviewToggle <CR>", "Toggle markdown preview"}
  }
}

M.mru = {
  n = {
    ["<leader>m"] = {"<cmd> MRU <CR>", "Most recently used"}
  }
}

M.telescope = {
  n = {
    ["<leader>fs"] = {"<cmd> Telescope live_grep <CR>", "Live grep"},
    ["<leader>fw"] = {"<cmd> Telescope grep_string <CR>", "Grep word under cursor"},
    ["<leader>cb"] = {"<cmd> Telescope git_bcommits <CR>", "Buffer git commits"}
  }
}

M.trouble = {
  n = {
    ["<leader>t"] = {"<cmd> TroubleToggle <CR>", "Toggle Trouble"}
  }
}

return M
