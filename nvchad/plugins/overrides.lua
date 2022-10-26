local M = {}

M.gitsigns = {
  signs = {
    add = { hl = 'GitGutterAdd', text = '▎', numhl = 'GitSignsAddNr' },
    change = { hl = 'GitGutterChange', text = '▎', numhl = 'GitSignsChangeNr' },
    delete = { hl = 'GitGutterDelete', text = '_', numhl = 'GitSignsDeleteNr' },
    topdelete = { hl = 'GitGutterDelete', text = '‾', numhl = 'GitSignsDeleteNr' },
    changedelete = { hl = 'GitGutterChange', text = '~', numhl = 'GitSignsChangeNr' },
  },
  signcolumn = true,
  current_line_blame = true,
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>'
}

M.nvchad = {
  tabufline = {
    enabled = false
  }
}

M.mason = {
  ensure_installed = {
    -- dap
    "chrome-debug-adapter",
    "firefox-debug-adapter",

    -- formatters
    "prettier",
    "prettierd",
    "stylua",

    -- linters
    "commitlint",
    "eslint_d",
    "jsonlint",
    "yamllint",

    -- lsp
    "bash-language-server",
    "css-lsp",
    "cssmodules-language-server",
    "dockerfile-language-server",
    "eslint-lsp",
    "html-lsp",
    "json-lsp",
    "lua-language-server",
    "tailwindcss-language-server",
    "typescript-language-server",
    "vim-language-server",
    "yaml-language-server"
  },
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
}

M.nvimtree = {
  git = {
    enable = true
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true
      }
    }
  }
}

M.treesitter = {
  ensure_installed = {
    "bash",
    "comment",
    "css",
    "diff",
    "dockerfile",
    "dot",
    "gitattributes",
    "gitignore",
    "help",
    "hjson",
    "html",
    "http",
    "javascript",
    "jsdoc",
    "json",
    "jsonc",
    "json5",
    "lua",
    "markdown",
    "regex",
    "scss",
    "todotxt",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "yaml"
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      scope_incremental = '<CR>',
      node_incremental = '<TAB>',
      node_decremental = '<S-TAB>'
    }
  }
}

return M
