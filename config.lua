--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

-- general
lvim.log.level = "info"
lvim.format_on_save = {
	enabled = true,
	pattern = "*.lua",
	timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<F2>"] = ":DiffviewClose<CR>"
lvim.builtin.which_key.mappings["f"] = {}

-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["sT"] = { "<cmd>Telescope grep_string<CR>", "Find text under cursor" }

-- lvim.builtin.which_key.mappings["gL"] = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "View full Git blame" }
-- l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
-- maps.n["<leader>gL"] = { function() require("gitsigns").blame_line { full = true } end, desc = "View full Git blame" }

lvim.keys.normal_mode["<leader>gL"] = {
	function()
		require("gitsigns").blame_line({ full = true })
	end,
	desc = "View full Git blame",
}

-- -- Change theme settings
lvim.colorscheme = "kanagawa"
lvim.builtin.lualine.options.theme = "gruvbox"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "startify"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.cmp.completion.keyword_length = 2
-- lvim.builtin.telescope.defaults.layout_config.width = 0.95
-- lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 75

lvim.builtin.telescope.theme = "ivy"
lvim.builtin.telescope.pickers.git_files.hidden = false
lvim.builtin.telescope.pickers.find_files.hidden = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "stylua" },
	{ command = "puppet_lint", filetypes = { "puppet" } },
	{
		name = "prettier",
		---@usage arguments to pass to the formatter
		-- these cannot contain whitespace
		-- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
		args = { "--print-width", "100" },
		---@usage only start in these filetypes, by default it will attach to all filetypes it supports
		filetypes = { "typescript", "typescriptreact" },
	},
})
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "flake8", filetypes = { "python" } },
	{
		command = "shellcheck",
		args = { "--severity", "warning" },
	},
})

-- local diagnostics = require("lvim.lsp.null-ls.diagnostics")
-- diagnostics.setup({
-- 	{
-- 		-- name = "proselint",
-- 		name = "gitsigns",
-- 	},
-- })

-- local code_actions = require("lvim.lsp.null-ls.code_actions")
-- code_actions.setup({
-- 	{
-- name = "proselint",
-- name = "gitsigns",
-- 	},
-- })

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
	{ "rodjek/vim-puppet" },

	{
		"phaazon/hop.nvim",
		branch = "v2",
		event = "BufRead",
		config = function()
			require("hop").setup()
			-- vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
			vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
		end,
	},
	{
		"sindrets/diffview.nvim",
		event = "BufRead",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>gD", "<cmd>DiffviewOpen origin<cr>", desc = "Open DiffviewOpen" },
			["<F2>"] = { ":DiffviewClose<cr>", desc = "Close Diff View" }, -- closing Diffview
		},
	},
	{
		"rebelot/kanagawa.nvim",
		opts = {
			compile = false, -- enable compiling the colorscheme
			undercurl = true, -- enable undercurls
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			typeStyle = {},
			dimInactive = false, -- dim inactive window `:h hl-NormalNC`
			terminalColors = true, -- define vim.g.terminal_color_{0,17}
			colors = {
				palette = {
					-- change all usages of these colors
					sumiInk0 = "#000000",
					-- Diff and Git
					winterGreen = "#2B3328",
					winterYellow = "#49443C",
					winterRed = "#43242B",
					winterBlue = "#252535",
					autumnGreen = "#76946A",
					autumnRed = "#C34043",
					autumnYellow = "#DCA561",
					fujiWhite = "#fffaf0",
				},
				theme = {
					-- change specific usages for a certain theme, or for all of them
					wave = {
						ui = {
							float = {
								bg = "none",
							},
						},
					},
					dragon = {
						syn = {
							parameter = "yellow",
						},
					},
					all = {
						ui = {
							bg_gutter = "none",
							bg = "none",
						},
					},
				},
			},
			theme = "dragon", -- Load "dragon" theme when 'background' option is not set
		},
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		-- config = function()
		--   require("todo-comments").setup {}
		-- end
		opts = {},
		event = "User AstroFile",
		cmd = { "TodoQuickFix" },
		keys = {
			{ "<leader>T", "<cmd>TodoTelescope<cr>", desc = "Open TODOs in Telescope" },
		},
	},
	{
		"pearofducks/ansible-vim",
		ft = "yaml.ansible",
		event = "BufRead",
		-- config = function()
		-- vim.cmd [[au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible]]
		-- vim.cmd [[au BufRead,BufNewFile *ctl.yml set filetype=yaml.ansible]]
		-- end,
	},
}

local function yaml_ft(path, bufnr)
	-- get content of buffer as string
	local content = vim.filetype.getlines(bufnr)
	if type(content) == "table" then
		content = table.concat(content, "\n")
	end

	-- check if file is in roles, tasks, or handlers folder
	local path_regex = vim.regex("(tasks\\|handlers|\\ctl.yml)/")
	if path_regex and path_regex:match_str(path) then
		return "yaml.ansible"
	end
	-- check for known ansible playbook text and if found, return yaml.ansible
	local regex = vim.regex("become:\\|gather_facts:")
	if regex and regex:match_str(content) then
		return "yaml.ansible"
	end

	-- return yaml if nothing else
	return "yaml"
end

vim.filetype.add({
	extension = {
		yml = yaml_ft,
		yaml = yaml_ft,
	},
})

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
vim.api.nvim_create_autocmd("FileType", {
	pattern = "zsh",
	callback = function()
		-- let treesitter use bash highlight for zsh files as well
		require("nvim-treesitter.highlight").attach(0, "bash")
	end,
})
