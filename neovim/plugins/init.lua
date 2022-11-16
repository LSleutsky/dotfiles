local overrides = require "custom.plugins.overrides"

return {
  ["folke/todo-comments.nvim"] = {
    after = "plenary.nvim",
    config = function()
      require "custom.plugins.configs.todo-comments"
    end
  },

  ["LudoPinelli/comment-box.nvim"] = {
    cmd = { "CBlbox", "CBclbox", "CBcbox", "CBccbox", "CBalbox", "CBaclbox", "CBacbox", "CBaccbox", "CBline", "CBcline" },
    config = function()
      require "custom.plugins.configs.comment-box"
    end
  },

  ["dstein64/vim-startuptime"] = {},

  ["gorbit99/codewindow.nvim"] = {
    config = function()
      require "custom.plugins.configs.codewindow"
    end
  },

  ["gbprod/stay-in-place.nvim"] = {
    config = function()
      require "custom.plugins.configs.stay-in-place"
    end
  },

  ["kkoomen/vim-doge"] = {
    run = "npm i --no-save && npm run build:binary:unix"
  },

  ["iamcco/markdown-preview.nvim"] = {
    event = "BufWinEnter",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown"}
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.configs.null-ls"
    end
  },

  ["karb94/neoscroll.nvim"] = {
    event = "BufWinEnter",
    config = function()
      require "custom.plugins.configs.neoscroll"
    end
  },

  ["kylechui/nvim-surround"] = {
    event = "BufWinEnter",
    config = function()
      require "custom.plugins.configs.nvim-surround"
    end
  },

  ["mg979/vim-visual-multi"] = {
    config = function()
      vim.g.VM_leader = ";"
    end
  },

  ["nathom/filetype.nvim"] = {},

  ["p00f/nvim-ts-rainbow"] = {
    after = "nvim-treesitter"
  },

  ["romgrk/barbar.nvim"] = {
    event = "BufWinEnter",
    after = "nvim-web-devicons",
    config = function()
      require "custom.plugins.configs.barbar"
    end
  },

  ["ruifm/gitlinker.nvim"] = {
    after = "plenary.nvim",
    config = function()
      require "custom.plugins.configs.gitlinker"
    end
  },

  ["windwp/nvim-ts-autotag"] = {
    event = "InsertEnter",
    after = "nvim-treesitter"
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
    disable = false,
    override_options = overrides.alpha
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

  ["nvim-telescope/telescope.nvim"] = {
    override_options = overrides.telescope
  },

  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason
  }
}
