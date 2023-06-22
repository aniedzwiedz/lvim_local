-- lvim.builtin.alpha.dashboard.section.header.val = {
--   "    __                          _    ___         ",
--   "   / /   __  ______  ____ _____| |  / (_)___ ___ ",
--   "  / /   / / / / __ \\/ __ `/ ___/ | / / / __ `__ \\",
--   " / /___/ /_/ / / / / /_/ / /   | |/ / / / / / / /",
--   "/_____/\\__,_/_/ /_/\\__,_/_/    |___/_/_/ /_/ /_/ ",
-- }

lvim.builtin.alpha.dashboard.section.header.val = {
  {
    [[     _O_        _____         _<>_          ___     ]],
    [[   /     \     |     |      /      \      /  _  \   ]],
    [[  |==/=\==|    |[/_\]|     |==\==/==|    |  / \  |  ]],
    [[  |  O O  |    / O O \     |   ><   |    |  |"|  |  ]],
    [[   \  V  /    /\  -  /\  ,-\   ()   /-.   \  X  /   ]],
    [[   /`---'\     /`---'\   V( `-====-' )V   /`---'\   ]],
    [[   O'_:_`O     O'M|M`O   (_____:|_____)   O'_|_`O   ]],
    [[    -- --       -- --      ----  ----      -- --    ]],
    [[   STAN         KYLE        CARTMAN        KENNY    ]],
  },
}

-- -- Change theme settings
lvim.colorscheme = "kanagawa-wave"
-- lvim.colorscheme = "onedark"
lvim.builtin.lualine.options.theme = "onedark_gray"
-- lvim.builtin.lualine.options.theme = "onedark"

lvim.log.level = "warn"
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "startify"
-- vim options
vim.opt.listchars = {
  eol = "⤶",
  space = "⋅",
  trail = "✚",
  extends = "◀",
  precedes = "▶",
}
-- vim.opt.listchars = { eol = "↵", space = "⋅" }
vim.opt.list = true
-- vim.lsp.buf.format { timeout_ms = 2000 }

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.linebreak = true
-- vim.opt.list = false
vim.opt.inccommand = "split"

-- general
vim.diagnostic.config { virtual_text = true }
lvim.transparent_window = true
-- lvim.line_wrap_cursor_movement = false
-- lvim.builtin.alpha.active = false
-- lvim.builtin.lir.active = false
-- lvim.builtin.comment.active = false
-- lvim.builtin.terminal.active = true
lvim.builtin.project.active = true
lvim.builtin.indentlines.active = false
lvim.builtin.treesitter.ignore_install = { "kotlin" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.highlight.enable = true
-- lvim.builtin.nvimtree.setup.open_on_setup = false
-- lvim.builtin.treesitter.highlight.additional_vim_regex_highlighting = false
lvim.builtin.treesitter.playground.enable = true
-- lvim.builtin.treesitter.textsubjects.enable = true
-- lvim.builtin.treesitter.textsubjects.keymaps[";"] = "textsubjects-big"
-- lvim.builtin.treesitter.textsubjects.keymaps["."] = "textsubjects-smart";
lvim.lsp.document_highlight = true

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
lvim.keys.normal_mode["<F4>"] = ":DiffviewClose<CR>"
-- lvim.builtin.which_key.mappings["f"] = {}
lvim.builtin.which_key.mappings["s"] = {}

-- Search and replace word under cursor using <F2>
vim.cmd [[ nnoremap <F2> :%s/<c-r><c-w>/<c-r><c-w>/gc<c-f>$F/i ]]

-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["fT"] = { "<cmd>Telescope grep_string<CR>", "Find text under cursor" }

-- lvim.builtin.lualine.sections.lualine_c = { "diff" }

-- lvim.builtin.which_key.mappings["gL"] = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "View full Git blame" }
-- l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
-- maps.n["<leader>gL"] = { function() require("gitsigns").blame_line { full = true } end, desc = "View full Git blame" }

lvim.keys.normal_mode["<leader>gL"] = {
  function()
    require("gitsigns").blame_line { full = true }
  end,
  desc = "View full Git blame",
}

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

-- -- always installed on startup, useful for parsers without a strict filetype
lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex", "ruby", "python" }

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
  local path_regex = vim.regex "(tasks\\|handlers|\\ctl.yml)/"
  if path_regex and path_regex:match_str(path) then
    return "yaml.ansible"
  end
  -- check for known ansible playbook text and if found, return yaml.ansible
  local regex = vim.regex "become:\\|gather_facts:"
  if regex and regex:match_str(content) then
    return "yaml.ansible"
  end

  -- return yaml if nothing else
  return "yaml"
end

vim.filetype.add {
  extension = {
    yml = yaml_ft,
    yaml = yaml_ft,
  },
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
vim.api.nvim_create_autocmd("FileType", {
  pattern = "zsh",
  callback = function()
    -- let treesitter use bash highlight for zsh files as well
    require("nvim-treesitter.highlight").attach(0, "bash")
  end,
})

vim.filetype.add {
  extension = {
    conf = "dosini",
  },
}

local options = {
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 1, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 0, -- always show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 100, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  laststatus = 3,
  showcmd = false,
  ruler = false,
  relativenumber = true, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  -- wrap = false, -- display lines as one long line
  -- scrolloff = 0,
  sidescrolloff = 8,
  guifont = "monospace:h17", -- the font used in graphical neovim applications
  title = true,
  titleold = vim.split(os.getenv "SHELL" or "", "/")[3],
  -- colorcolumn = "80",
  -- colorcolumn = "120",
}

-- vim.opt.fillchars = vim.opt.fillchars + "eob: "
-- vim.opt.fillchars:append {
-- stl = " ",
-- }

-- vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
vim.cmd [[ set clipboard+=unnamedplus ]]

vim.filetype.add {
  extension = {
    conf = "dosini",
  },
}
