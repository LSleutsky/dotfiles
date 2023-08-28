local M = {}

M.gitsigns = {
  signs = {
    add = { hl = "GitGutterAdd", text = "▎", numhl = "GitSignsAddNr" },
    change = { hl = "GitGutterChange", text = "▎", numhl = "GitSignsChangeNr" },
    delete = { hl = "GitGutterDelete", text = "_", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "GitGutterDelete", text = "‾", numhl = "GitSignsDeleteNr" },
    changedelete = { hl = "GitGutterChange", text = "~", numhl = "GitSignsChangeNr" },
  },
  signcolumn = true,
  current_line_blame = true,
  current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>"
}

M.ui = {
  statusline = {
    -- modules arg here is the default table of modules
    overriden_modules = function(modules)
      table.insert(modules, " Ln %l, Col %c")
    end,
  },
}

M.mason = {
  ensure_installed = {
    "bash-language-server",
    "css-lsp",
    "cssmodules-language-server",
    "diagnostic-languageserver",
    "docker-compose-language-service",
    "dockerfile-language-server",
    "eslint_d",
    "eslint-lsp",
    "html-lsp",
    "json-lsp",
    "jsonlint",
    "lua-language-server",
    "lua-lsp",
    "prettier",
    "stylua",
    "tailwindcss-language-server",
    "typescript-language-server",
    "yamllint",
    "vim-language-server",
    "yaml-language-server",
    "yamllint"
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

M.telescope = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=auto",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "-u"
    },
    file_ignore_patterns = {
      "node_modules",
      "build",
      "dist",
      "bin",
      "coverage",
      "package-lock.json",
      "yarn.lock",
      ".git",
      ".gitignore",
      "CHANGELOG",
      "LICENSE"
    }
  }
}

M.treesitter = {
  autotag = {
    enable = true
  },
  ensure_installed = {
    "bash",
    "comment",
    "cpp",
    "css",
    "csv",
    "diff",
    "dockerfile",
    "dot",
    "fish",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "graphql",
    "hjson",
    "html",
    "htmldjango",
    "http",
    "ini",
    "javascript",
    "jsdoc",
    "json",
    "jsonc",
    "json5",
    "lua",
    "luap",
    "luau",
    "markdown",
    "markdown_inline",
    "mermaid",
    "passwd",
    "php",
    "pug",
    "python",
    "query",
    "regex",
    "ruby",
    "rust",
    "scss",
    "sql",
    "svelte",
    "todotxt",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "yaml",
    "yuck",
    "xml",
    "zig"
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      scope_incremental = "<CR>",
      node_incremental = "<TAB>",
      node_decremental = "<S-TAB>"
    }
  },
  matchup = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = false
  }
}

return M
