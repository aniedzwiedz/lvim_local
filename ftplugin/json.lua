local json_opts = {
	settings = {
		json = {
			schemas = vim.list_extend({
				{
					description = "pyright config",
					fileMatch = { "pyrightconfig.json" },
					name = "pyrightconfig.json",
					url = "https://raw.githubusercontent.com/microsoft/pyright/main/packages/vscode-pyright/schemas/pyrightconfig.schema.json",
				},
			}, require("schemastore").json.schemas({})),
		},
	},
}

require("lvim.lsp.manager").setup("jsonls", json_opts)

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "jq", filetypes = { "json" } },
})

-- Supported source(s)
-- * formatting: deno_fmt | dprint | fixjson | jq | json_tool | prettier | prettier_d_slim | prettier_eslint | prettierd | rome
-- * diagnostics: cfn_lint | jsonlint | spectral | vacuum
