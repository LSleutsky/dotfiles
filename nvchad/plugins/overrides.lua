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
  statusline = {
    overriden_modules = function()
      local st_modules = require "nvchad_ui.statusline.modules"

      return {
        cursor_position = function()
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          local cp = st_modules.cursor_position()

          return cp .. "| " .. line .. ":" .. (col + 1) .. " "
        end
      }
    end
  },
  tabufline = {
    enabled = false
  }
}

M.mason = {
  ensure_installed = {
    -- dap
    'chrome-debug-adapter',
    'firefox-debug-adapter',

    -- formatters
    'prettier',
    'prettierd',
    'stylua',

    -- linters
    'commitlint',
    'eslint_d',
    'jsonlint',
    'yamllint',

    -- lsp
    'bash-language-server',
    'css-lsp',
    'cssmodules-language-server',
    'dockerfile-language-server',
    'eslint-lsp',
    'html-lsp',
    'json-lsp',
    'lua-language-server',
    'tailwindcss-language-server',
    'typescript-language-server',
    'vim-language-server',
    'yaml-language-server'
  },
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗'
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

M.telescope = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "-u"
    }
  }
}

M.treesitter = {
  autotag = {
    enable = true
  },
  ensure_installed = {
    'bash',
    'comment',
    'css',
    'diff',
    'dockerfile',
    'dot',
    'gitattributes',
    'gitignore',
    'help',
    'hjson',
    'html',
    'http',
    'javascript',
    'jsdoc',
    'json',
    'jsonc',
    'json5',
    'lua',
    'markdown',
    'regex',
    'scss',
    'todotxt',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'yaml'
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      scope_incremental = '<CR>',
      node_incremental = '<TAB>',
      node_decremental = '<S-TAB>'
    }
  },
  rainbow = {
    enable = true,
    extended_mode = true
  }
}

return M
