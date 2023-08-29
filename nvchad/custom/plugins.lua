local overrides = require("custom.configs.overrides")

local plugins = {
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime"
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "mg979/vim-visual-multi"
  },

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
	  "piersolenski/wtf.nvim",
	  dependencies = {
		  "MunifTanjim/nui.nvim",
	  },
	  event = "VeryLazy",
  	opts = {
      -- openai_api_key = ""
    },
	  keys = {
		  {
			  "gw",
			  mode = { "n" },
			  function()
				  require("wtf").ai()
			  end,
			  desc = "Debug diagnostic with AI",
		  },
		  {
			  mode = { "n" },
			  "gW",
			  function()
				  require("wtf").search()
			  end,
			  desc = "Search diagnostic with Google",
		  },
	  },
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
