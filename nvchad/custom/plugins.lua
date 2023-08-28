local overrides = require("custom.configs.overrides")

local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime"
  },

  {
    "mg979/vim-visual-multi"
  },

  {
    "SmiteshP/nvim-navic",
    config = function()
      dofile(vim.g.base46_cache .. "navic")
      require("nvim-navic").setup({
        highlight = true,
        lsp = { auto_attach = true }
      })
    end
  },

  --  ╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
  --  │ overrides                                                                                        │
  --  ╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
}

return plugins
