-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {

  { "rodjek/vim-puppet" },
  { "ChristianChiarulli/onedark.nvim" },
  {
    "NvChad/nvim-colorizer.lua",
    -- cmd = { "ColorizerToggle", "ColorizerAttachToBuffer", "ColorizerDetachFromBuffer", "ColorizerReloadAllBuffers" },
  },
  { "simrat39/rust-tools.nvim" },
  { "MunifTanjim/nui.nvim" },
  { "is0n/jaq-nvim" },
  { "j-hui/fidget.nvim" },
  { "kylechui/nvim-surround" },
  { "mfussenegger/nvim-jdtls" },

  { "windwp/nvim-spectre" },
  { "ruifm/gitlinker.nvim" },
  { "lvimuser/lsp-inlayhints.nvim" },
  { "adoyle-h/lsp-toggle.nvim" },
  { "folke/trouble.nvim" },

  { "roobert/tailwindcss-colorizer-cmp.nvim" },
  { "RRethy/vim-illuminate" },
  -- "nvim-treesitter/playground",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "opalmay/vim-smoothie",
  {
    "hrsh7th/cmp-emoji",
    event = "BufRead",
  },
  { "christianchiarulli/telescope-tabs", branch = "chris" },
  { "christianchiarulli/bookmark.nvim" },
  -- { "TimUntersberger/neogit" },
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
      -- ["<F4>"] = { ":DiffviewClose<cr>", desc = "Close Diff View" }, -- closing Diffview
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
    -- keys = {
    --   { "<leader>fT", "<cmd>TodoTelescope<cr>", desc = "Open TODOs in Telescope" },
    -- },
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

  { "ChristianChiarulli/swenv.nvim" },
  { "stevearc/dressing.nvim" },
  { "mfussenegger/nvim-dap-python" },
  { "nvim-neotest/neotest" },
  { "nvim-neotest/neotest-python" },
}
