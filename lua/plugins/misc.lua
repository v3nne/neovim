return {
  {
    -- Tmux & split window navigation
    'christoomey/vim-tmux-navigator',
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<A-Left>", "<cmd>TmuxNavigateLeft<cr>" },
      { "<A-Down>", "<cmd>TmuxNavigateDown<cr>" },
      { "<A-Up>", "<cmd>TmuxNavigateUp<cr>" },
      { "<A-Right>", "<cmd>TmuxNavigateRight<cr>" },
      { "<A-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
  },
  {
    -- Powerful Git integration for Vim
    'tpope/vim-fugitive',
  },
  {
    -- GitHub integration for vim-fugitive
    'tpope/vim-rhubarb',
  },
  { "tpope/vim-commentary" },
  {
    -- Hints keybinds
    'folke/which-key.nvim',
    opts = {

    },
    config = function ()
      -- vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "none" })

      require("which-key").setup({
        delay = 300,
        win = {
          border = "rounded"
        },
        wo = {
          winblend = 100
        }
      })
    end
  },
  {
    -- Autoclose parentheses, brackets, quotes, etc.
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {},
  },
  {
    -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  {
    -- High-performance color highlighter
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
}
