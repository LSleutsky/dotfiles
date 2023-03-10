--  ╭────────────────────────────────────────────────────────────────────────────────────────╮
--  │  general                                                                               │
--  ╰────────────────────────────────────────────────────────────────────────────────────────╯

vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.linebreak = true
vim.opt.preserveindent = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.wrap = true
vim.opt.termguicolors = true

--  ╭────────────────────────────────────────────────────────────────────────────────────────╮
--  │ lvim                                                                                   │
--  ╰────────────────────────────────────────────────────────────────────────────────────────╯

lvim.colorscheme = "dracula"
lvim.log.level = "info"
lvim.format_on_save = {
	enabled = true,
	pattern = "*.lua",
	timeout = 1000,
}

--  ╭────────────────────────────────────────────────────────────────────────────────────────╮
--  │ keymappings                                                                            │
--  ╰────────────────────────────────────────────────────────────────────────────────────────╯

lvim.leader = "space"

-- normal mode
lvim.keys.normal_mode["<C-s>"] = ":w <cr>"
lvim.keys.normal_mode["<C-S-s>"] = ":wa <cr>"
lvim.keys.normal_mode["<tab>"] = "<cmd> BufferLineCycleNext <cr>"
lvim.keys.normal_mode["<S-tab>"] = "<cmd> BufferLineCyclePrev <cr>"
lvim.keys.normal_mode["<S-q>"] = "<cmd> BufferKill <cr>"
lvim.keys.normal_mode["<leader>xb"] = "<cmd> CBlbox <cr>"
lvim.keys.normal_mode["<leader>xl"] = "<cmd> CBline <cr>"

-- insert mode
lvim.keys.insert_mode["<C-s>"] = "<esc> :w <cr>"
lvim.keys.insert_mode["<C-S-s>"] = "<esc> :wa <cr>"

-- which key
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

--  ╭────────────────────────────────────────────────────────────────────────────────────────╮
--  │ builtins                                                                               │
--  ╰────────────────────────────────────────────────────────────────────────────────────────╯

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.lualine.style = "default"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.terminal.active = true
lvim.builtin.treesitter.auto_install = true

lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"comment",
	"css",
	"diff",
	"dockerfile",
	"dot",
	"git_rebase",
	"gitattributes",
	"gitcommit",
	"gitignore",
	"graphql",
	"help",
	"hjson",
	"html",
	"http",
	"javascript",
	"jsdoc",
	"json",
	"json5",
	"jsonc",
	"lua",
	"make",
	"markdown",
	"markdown_inline",
	"mermaid",
	"php",
	"pug",
	"python",
	"query",
	"regex",
	"ruby",
	"rust",
	"scss",
	"todotxt",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"yaml",
}

--  ╭────────────────────────────────────────────────────────────────────────────────────────╮
--  │ lsp                                                                                    │
--  ╰────────────────────────────────────────────────────────────────────────────────────────╯

-- formatters
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "stylua" },
	{
		command = "prettierd",
		extra_args = { "--print-width", "100" },
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	},
	{
		command = "eslint_d",
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	},
})

-- linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{
		command = "eslint_d",
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	},
})

--  ╭────────────────────────────────────────────────────────────────────────────────────────╮
--  │ extra plugins                                                                          │
--  ╰────────────────────────────────────────────────────────────────────────────────────────╯

lvim.plugins = {
	-- general
	{ "nathom/filetype.nvim" },

	-- utility
	{
		"kylechui/nvim-surround",
		event = "InsertEnter",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"s1n7ax/nvim-search-and-replace",
		config = function()
			require("nvim-search-and-replace").setup({
				ignore = { "**/node_modules/**", "**/.git/**", "**/.github/**", "**/.gitignore", "build/**", "dist/**" },
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-treesitter.configs").setup({
				autotag = {
					enable = true,
					filetypes = {
						"html",
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
						"jsx",
						"markdown",
					},
				},
			})
		end,
	},

	-- ui
	{ "mg979/vim-visual-multi", after = "nvim-treesitter" },
	{ "Mofiqul/dracula.nvim" },
	{
		"HiPhish/nvim-ts-rainbow2",
		config = function()
			require("nvim-treesitter.configs").setup({
				rainbow = {
					enable = true,
					query = "rainbow-parens",
					strategy = require("ts-rainbow.strategy.global"),
				},
			})
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "css", "scss", "html", "javascript", "javascriptreact" }, {
				RGB = true,
				RRGGBB = true,
				RRGGBBAA = true,
				rgb_fn = true,
				hsl_fn = true,
				css = true,
				css_fn = true,
			})
		end,
	},

	-- comments
	{
		"folke/todo-comments.nvim",
		after = "plenary.nvim",
		config = function()
			require("todo-comments").setup()
		end,
	},
	{
		"LudoPinelli/comment-box.nvim",
		cmd = { "CBlbox", "CBline" },
		config = function()
			require("comment-box").setup({
				doc_width = 90,
				box_width = 90,
				line_width = 90,
			})
		end,
	},

	-- git
	{
		"akinsho/git-conflict.nvim",
		config = function()
			require("git-conflict").setup()
		end,
	},
	{
		"ruifm/gitlinker.nvim",
		after = "plenary.nvim",
		config = function()
			require("gitlinker").setup({
				opts = {
					add_current_line_on_normal_mode = true,
					print_url = true,
				},
				mappings = "<leader>gl",
			})
		end,
	},
	{
		"sindrets/diffview.nvim",
		after = "plenary.nvim",
		config = function()
			require("diffview").setup({
				enhanced_diff_hl = false,
				git_cmd = { "git" },
				use_icons = true,
				icons = {
					folder_closed = "",
					folder_open = "",
				},
				signs = {
					fold_closed = "",
					fold_open = "",
					done = "✓",
				},
				file_panel = {
					listing_style = "tree",
				},
			})
		end,
	},
}

--  ╭────────────────────────────────────────────────────────────────────────────────────────╮
--  │ autocommands                                                                           │
--  ╰────────────────────────────────────────────────────────────────────────────────────────╯

vim.api.nvim_create_autocmd("FileType", {
	pattern = "zsh",
	callback = function()
		require("nvim-treesitter.highlight").attach(0, "bash")
	end,
})
