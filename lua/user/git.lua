vim.g.gitblame_enabled = 0
vim.g.gitblame_message_template = "<summary> • <date> • <author>"
vim.g.gitblame_highlight_group = "LineNr"

lvim.builtin.gitsigns.opts.attach_to_untracked = false

vim.g.gist_open_browser_after_post = 1

local status_ok, gitlinker = pcall(require, "gitlinker")
if not status_ok then
  return
end

-- vim.api.nvim_set_keymap('n', '<leader>gY', '<cmd>lua require"gitlinker".get_repo_url()<cr>', { silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>gB",
  '<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>',
  { silent = true }
)

gitlinker.setup {
  opts = {
    callbacks = {
      -- ["git.comcast.com"] = require("gitlinker.hosts").get_github_type_url,
      ["git.gtech.com"] = require("gitlinker.hosts").get_github_type_url,
    },
    -- remote = 'github', -- force the use of a specific remote
    -- adds current line nr in the url for normal mode
    add_current_line_on_normal_mode = true,
    -- callback for what to do with the url
    action_callback = require("gitlinker.actions").copy_to_clipboard,
    -- print the url after performing the action
    print_url = true,
    -- mapping to call url generation
    -- mappings = "<leader>gy",
  },
}
