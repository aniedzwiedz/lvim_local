vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "yamlls" })
local yaml_opts = {
  settings = {
    yaml = {
      hover = true,
      completion = true,
      validate = true,
      schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json",
      },
      schemas = require("schemastore").yaml.schemas(),
    },
  },
}

-- print(vim.api.nvim_buf_get_name(0))
local linters = require "lvim.lsp.null-ls.linters"
local formatters = require "lvim.lsp.null-ls.formatters"
local code_actions = require "lvim.lsp.null-ls.code_actions"

local path = vim.api.nvim_buf_get_name(0)
local parts = vim.split(path, "/")
local filename = parts[#parts]
-- print(filename)

-- check if ansidble is in file extension
if string.find(filename, "ansible") then
  require("lvim.lsp.manager").setup("ansiblels", {})
else
  require("lvim.lsp.manager").setup("yamlls", {

    linters.setup {
      { command = "yamllint", filetypes = { "yaml" } },
    },

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
    },

    code_actions.setup {
      { command = "gitsigns", filetypes = { "yaml" } },
      -- { command = "gitrebase", filetypes = { "yaml" } },
      -- { command = "gitsigns" },
    },
  })
end

return yaml_opts
-- vim.schedule(function()
--   if vim.opt.filetype:get() == "yaml" then
--     require("lvim.lsp.manager").setup("yamlls", {})
--   end
-- end)
