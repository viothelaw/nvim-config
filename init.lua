if (vim.pack == nil) then
     error("NeoVim Builtin package manager only availabe in Neovim v0.12.0 or later")
     return
end

-- It's by choice to require each file manually rather than require all files in a directory.
-- To have more control on adding and remoting configs or plugins
require('config.options')
require('config.keymaps')
require('config.autocmds')

require('plugins.colorscheme')
require('plugins.bufferline')
require('plugins.lualine')
require('plugins.vim-fugitive')
require('plugins.fzf-lua')
require('plugins.nvim-treesitter')
require('plugins.lsp')

-- run ':lua vim.pack.update()' to update packages
-- run ':lua.print(vim.inspect(vim.pack.get()))' to see all packages
-- run ':lua vim.pack.del({'nordic.nvim','nvim-lspconfig'}) to delete plugins from disk
