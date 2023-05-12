local M = {}

local Log = require("lvim.core.log")

local null_ls = require("null-ls")
local services = require("lvim.lsp.null-ls.services")
local method = null_ls.methods.DIAGNOSTICS

function M.list_registered(filetype)
	local registered_providers = services.list_registered_providers_names(filetype)
	return registered_providers[method] or {}
end

function M.setup(diagnostics_configs)
	if vim.tbl_isempty(diagnostics_configs) then
		return
	end

	local registered = services.register_sources(diagnostics_configs, method)

	if #registered > 0 then
		Log:debug("Registered the following diagnostics: " .. unpack(registered))
	end
end

return M
