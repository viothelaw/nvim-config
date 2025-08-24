if (vim.pack == nil) then
     error("NeoVim Builtin package manager only availabe in Neovim v0.12.0 or later")
     return
end

require('config.options')
require('config.keymaps')
require('config.autocmds')

require('plugins.colorscheme')
require('plugins.bufferline')
require('plugins.lualine')
require('plugins.vim-fugitive')
require('plugins.plenary') -- required by telescope
require('plugins.telescope')
require('plugins.nvim-treesitter')
require('plugins.lsp')

-- run ':lua vim.pack.update()' to update packages
-- run ':lua.print(vim.inspect(vim.pack.get()))' to see all packages
