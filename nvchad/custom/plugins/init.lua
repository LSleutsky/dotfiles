local overrides = require "custom.plugins.overrides"

return {
  ["dstein64/vim-startuptime"] = {},

  ["folke/trouble.nvim"] = {
    config = function()
      require "custom.plugins.configs.trouble"
    end,
    ft = { "javascript" }
  },

  ["gorbit99/codewindow.nvim"] = {
    config = function()
      require "custom.plugins.configs.codewindow"
    end
  },

  ["gbprod/stay-in-place.nvim"] = {
    event = { "CursorMoved", "CursorMovedI" },
    config = function()
      require "custom.plugins.configs.stay-in-place"
    end
  },

  ["karb94/neoscroll.nvim"] = {
    config = function()
      require "custom.plugins.configs.neoscroll"
    end
  },

  ["kkoomen/vim-doge"] = {
    run = "npm i --no-save && npm run build:binary:unix"
  },

  ["kylechui/nvim-surround"] = {
    event = "InsertEnter",
    config = function()
      require "custom.plugins.configs.nvim-surround"
    end
  },

  ["iamcco/markdown-preview.nvim"] = {
    event = "BufWinEnter",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" }
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.configs.null-ls"
    end
  },

  ["mfussenegger/nvim-dap"] = {},

  ["mg979/vim-visual-multi"] = {
    after = "nvim-treesitter"
  },

  ["nathom/filetype.nvim"] = {},

  ["p00f/nvim-ts-rainbow"] = {
    after = "nvim-treesitter"
  },

  ["romgrk/barbar.nvim"] = {
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

  ["s1n7ax/nvim-search-and-replace"] = {
    config = function()
      require "custom.plugins.configs.nvim-search-and-replace"
    end
  },

  ["windwp/nvim-ts-autotag"] = {
    event = "InsertEnter",
    after = "nvim-treesitter"
  },

  ["yegappan/mru"] = {
    cmd = "MRU"
  },

  ["https://gitlab.com/yorickpeterse/nvim-pqf.git"] = {
    after ="nvim-lspconfig",
    config = function()
      require "custom.plugins.configs.nvim-pqf"
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

  -- comments
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


  --  ╭──────────────────────────────────────────────────────────╮
  --  │   Core Plugins                                           │
  --  ╰──────────────────────────────────────────────────────────╯

  ["goolord/alpha-nvim"] = {
    disable = false,
    cmd = "Alpha",
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
