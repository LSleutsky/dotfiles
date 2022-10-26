local overrides = require "custom.plugins.overrides"

return {
  ["LudoPinelli/comment-box.nvim"] = {},

  ["folke/todo-comments.nvim"] = {
    config = function()
      require "custom.plugins.configs.todo-comments"
    end
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.configs.null-ls"
    end
  },

  ["kylechui/nvim-surround"] = {
    config = function()
      require "custom.plugins.configs.nvim-surround"
    end
  },

  ["romgrk/barbar.nvim"] = {
    after = "nvim-web-devicons",
    config = function()
      require "custom.plugins.configs.barbar"
    end
  },

  -- git stuff
  ["akinsho/git-conflict.nvim"] = {
    tag = "*",
    config = function()
      require "custom.plugins.configs.git-conflict"
    end
  },

  ["sindrets/diffview.nvim"] = {
    after = "plenary.nvim",
    config = function()
      require "custom.plugins.configs.diffview"
    end
  },

  --  ╭──────────────────────────────────────────────────────────╮
  --  │   Core Plugins                                           │
  --  ╰──────────────────────────────────────────────────────────╯

  ["goolord/alpha-nvim"] = {
    disable = false
  },

  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree
  },

  ["lewis6991/gitsigns.nvim"] = {
    override_options = overrides.gitsigns
  },

  ["NvChad/ui"] = {
    override_options = overrides.nvchad
  },

  ["nvim-lua/plenary.nvim"] = {
    rm_default_opts  = true
  },

  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason
  }
}
