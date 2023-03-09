local M = {}

local function button(sc, txt, keybind)
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

  local opts = {
    position = "center",
    text = txt,
    shortcut = sc,
    cursor = 5,
    width = 36,
    align_shortcut = "right",
    hl = "AlphaButtons"
  }

  if keybind then
    opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
  end

  return {
    type = "button",
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true) or ""
      vim.api.nvim_feedkeys(key, "normal", false)
    end,
    opts = opts
  }
end

M.alpha = {
  buttons = {
    type = "group",
    val = {
      button("SPC f f", "  Project Files  ", "<cmd> Telescope find_files <CR>"),
      button("SPC f a", "  All Files  ", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>"),
      button("SPC f o", "  Recent Files  ", "<cmd> Telescope oldfiles <CR>"),
      button("SPC f s", "  Live Grep ", "<cmd> Telescope live_grep <CR>"),
      button("-", "  Exit", "<cmd> exit <CR>")
    },
    opts = {
      spacing = 1
    }
  }
}

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

M.nvchad = {
  statusline = {
    overriden_modules = function()
      local st_modules = require "nvchad_ui.statusline.modules"
      local separators = require("nvchad_ui.icons").statusline_separators["arrow"]

      return {
        cursor_position = function()
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          local cp = st_modules.cursor_position()

          return cp .. "| " .. line .. ":" .. (col + 1) .. " "
        end,
        fileInfo = function()
          local icon = "  "
          local path = (vim.fn.expand "%" == "" and "") or vim.fn.expand "%"

          if path ~= "" then
            local devicons_present, devicons = pcall(require, "nvim-web-devicons")

            if devicons_present then
              local ft_icon = devicons.get_icon(path)
              icon = (ft_icon ~= nil and " " .. ft_icon) or ""
            end

            path = " " .. path .. " "
          end

          return "%#St_file_info#" .. icon .. path .. "%#St_file_sep#" .. separators["right"]
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
    "chrome-debug-adapter",
    "firefox-debug-adapter",
    "node-debug2-adapter",

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
    "diagnostic-languageserver",
    "dockerfile-language-server",
    "docker-compose-language-service",
    "dot-language-server",
    "eslint-lsp",
    "html-lsp",
    "json-lsp",
    "lua-language-server",
    "lua-lsp",
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
