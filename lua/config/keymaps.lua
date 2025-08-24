-- Modes
--  'n' = normal_mode
--  'i' = insert_mode
--  'v' = visual_mode
--  'x' = visual_block_mode
--  't' = term_mode
--  'c' = command_mode

vim.g.mapleader = ' '
local opts = { noremap = true, silent = true }

-- Normal --
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Navigate buffers
vim.keymap.set('n', '<C-n>', ':bnext<CR>', opts)
vim.keymap.set('n', '<C-p>', ':bprevious<CR>', opts)

-- Insert --
-- Press jk fast to exit insert mode
vim.keymap.set('i', 'jk', '<ESC>', opts)
vim.keymap.set('i', 'kj', '<ESC>', opts)

-- Visual --
-- Stay in indent mode
-- vim.keymap.set('v', '<', '<gv^', opts)
-- vim.keymap.set('v', '>', '>gv^', opts)

