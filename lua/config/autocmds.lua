-- format options
-- c - Auto-wrap comments using textwidth, inserting the current comment leader automatically.
-- r - Automatically insert the current comment leader after hitting <Enter> in Insert mode.
-- o - Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.

-- Set option using autocmd to prevent config being overwritten
vim.api.nvim_create_autocmd('Filetype', {
    group = vim.api.nvim_create_augroup('user.format', { clear = true }),
    callback = function()
        vim.opt.formatoptions:remove({ 'c', 'r', 'o' })
    end

})

vim.opt.runtimepath:remove('/usr/share/vim/vimfiles')  -- separate vim plugins from neovim in case vim still in use


