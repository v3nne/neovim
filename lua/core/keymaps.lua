-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- save file without auto-formatting
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resize with arrows
vim.keymap.set('n', '<S-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<S-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<S-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<S-Right>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<C-PageDown>', ':bnext<CR>', opts)
vim.keymap.set('n', '<C-PageUp>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', opts) -- close buffer
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<A-Up>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<A-Down>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<A-Left>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<A-Right>', ':wincmd l<CR>', opts)

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode when indenting
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })







-- My stuff:

-- Paste with ctrl+v
vim.keymap.set('n', '<C-v>', 'p', opts)

-- Copy with ctrl+c
vim.keymap.set('n', '<C-c>', 'y', opts)

-- Undo with ctrl+Z
vim.api.nvim_set_keymap('n', '<C-z>', 'u', opts)
vim.api.nvim_set_keymap('n', '<C-S-z>', '<C-r>', opts)

-- Jump word with ctrl+arrowkey
vim.api.nvim_set_keymap('n', '<C-Left>', 'b', opts)
vim.api.nvim_set_keymap('n', '<C-Right>', 'w', opts)
vim.api.nvim_set_keymap('i', '<C-Left>', '<C-o>b', opts)
vim.api.nvim_set_keymap('i', '<C-Right>', '<C-o>w', opts)

-- Delete a word with ctrl+Backspace/Del  
vim.api.nvim_set_keymap('n', '<C-BS>', 'db', opts)
vim.api.nvim_set_keymap('n', '<C-Del>', 'dw', opts)
vim.api.nvim_set_keymap('i', '<C-BS>', '<C-o>db', opts)
vim.api.nvim_set_keymap('i', '<C-Del>', '<C-o>dw', opts)

