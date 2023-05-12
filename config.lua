--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

reload("user.plugins")
reload("user.colorizer")
reload("user.whichkey")
reload("user.lualine")
reload("user.git")
reload("user.lsp")
-- reload("user.neogit")

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

-- lvim.builtin.lualine.sections.lualine_c = { "diff" }

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
-- lvim.builtin.lualine.options.theme = "gruvbox"

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
