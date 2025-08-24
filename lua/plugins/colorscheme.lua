vim.pack.add({
    { src = 'https://github.com/cocopon/iceberg.vim' },
})

if (vim.env.COLORTERM == 'truecolor') then
    vim.opt.termguicolors = true
end

vim.cmd.colorscheme 'iceberg'
vim.api.nvim_set_hl(0, 'NonText', { link='Conceal' })

