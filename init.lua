--vim.g.tmux_navigator_no_mappings = 1
require 'core.options'
require 'core.keymaps'
local int_to_hex = require("utils").int_to_hex


local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }

  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  require 'plugins.themes.gruvbox',
  require 'plugins.neotree',
  require 'plugins.bufferline',
  require 'plugins.lualine',
  require 'plugins.treesitter',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.autocompletion',
  require 'plugins.alpha',
  require 'plugins.indent-blankline',
  require 'plugins.misc'
})


local normal_float = vim.api.nvim_get_hl(0, { name = "NormalFloat" })
local float_border = vim.api.nvim_get_hl(0, { name = "FloatBorder" })

-- the hl's also has `ctermfg` & `ctermbg` but not according to the lsp
vim.api.nvim_set_hl(0, "NormalFloat", { fg = int_to_hex(normal_float.fg) })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = int_to_hex(float_border.fg) })

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = "rounded" }
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signatureHelp,
  { border = "rounded" }
)

vim.diagnostic.config({
  float = {
    border = "rounded"
  }
})
