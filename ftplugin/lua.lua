-- setlocal formatoptions=tcq2l

vim.opt_local.formatoptions = tcq2l

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "stylua", filetypes = { "lua" } },
}
