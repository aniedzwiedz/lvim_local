vim.schedule(function()
  if vim.opt.filetype:get() == "yaml" then
    require("lvim.lsp.manager").setup("yamlls", {})
  end
end)

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    name = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespace
    -- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
    args = { "--print-width", "100" },
    ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
    filetypes = { "yaml" },
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "yamllint", filetypes = { "yaml" } },
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  { command = "gitsigns", filetypes = { "yaml" } },
  -- { command = "gitrebase", filetypes = { "yaml" } },
  -- { command = "gitsigns" },
}
