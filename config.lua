reload "user.lualine"
reload "user.plugins"
reload "user.colorizer"
reload "user.whichkey"
reload "user.git"
reload "user.lsp"
reload "user.autocommands"
reload "user.fidget"
reload "user.cmp"
reload "user.jaq"
reload "user.surround"
reload "user.bookmark"
reload "user.keymaps"
reload "user.nvimtree"
reload "user.todo-comments"
reload "user.webdev-icons"
reload "user.treesitter"
reload "user.spectre"
reload "user.options"

require("user.null_ls").config()
-- reload("user.neogit")
require("lsp-toggle").setup()

-- require("nvim.health").check()
-- let g:clipboard = {
--             \   'name': 'WslClipboard',
--             \   'copy': {
--             \      '+': 'clip.exe',
--             \      '*': 'clip.exe',
--             \    },
--             \   'paste': {
--             \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--             \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--             \   },
--             \   'cache_enabled': 0,
--             \ }
