vim.opt.autocomplete = true
vim.opt.complete='.^5,w^5,b^5,u^5' -- limit to 5 selection each
vim.opt.completeopt = { 'menuone', 'noselect', 'popup' }

local function pumvisible()
    return tonumber(vim.fn.pumvisible()) ~= 0
end
vim.keymap.set('i', '<C-j>', function() return pumvisible() and '<C-n>' or '<C-j>' end, { expr = true, desc='lsp - completion box move to next selection' })
vim.keymap.set('i', '<C-k>', function() return pumvisible() and '<C-p>' or '<C-k>' end, { expr = true, desc='lsp - completion box move to prev selection' })
