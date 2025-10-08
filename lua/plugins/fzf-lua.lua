vim.pack.add({
    { src = 'https://github.com/ibhagwan/fzf-lua' },
})

require('fzf-lua').setup({
    winopts = {
        preview = {
            layout = 'flex', -- 'flex'|'vertical'|'horizontal'
        },
    },

    keymap = {
        fzf = {
            -- fzf '--bind=' options
            -- true,        -- uncomment to inherit all the below in your custom config
            ['ctrl-d']      = 'half-page-down',
            ['ctrl-u']      = 'half-page-up',

        }
    },

    files = {
        formatter = 'path.dirname_first', -- show greyed-out directory before filenae
    },
})

vim.keymap.set('n', '<leader>fb', require('fzf-lua').buffers)
vim.keymap.set('n', '<leader>ff', require('fzf-lua').files)

--vim.keymap.set('n', '<leader>', require('fzf-lua').grep)             -- search for a pattern with `grep` or `rg`   |
--vim.keymap.set('n', '<leader>', require('fzf-lua').grep_last)        -- run search again with the last pattern     |
vim.keymap.set('n', '<leader>gw', require('fzf-lua').grep_cword)       -- search word under cursor                   |
vim.keymap.set('n', '<leader>gW', require('fzf-lua').grep_cWORD)       -- search WORD under cursor                   |
--vim.keymap.set('n', '<leader>', require('fzf-lua').grep_visual)      -- search visual selection                    |
vim.keymap.set('n', '<leader>gp', require('fzf-lua').grep_project)     -- search all project lines (fzf.vim's `:Rg`) |
vim.keymap.set('n', '<leader>gb', require('fzf-lua').grep_curbuf)      -- search current buffer lines                |
--vim.keymap.set('n', '<leader>', require('fzf-lua').grep_quickfix)    -- search the quickfix list                   |
--vim.keymap.set('n', '<leader>', require('fzf-lua').grep_loclist)     -- search the location list                   |
vim.keymap.set('n', '<leader>lb', require('fzf-lua').lgrep_curbuf)     -- live grep current buffer                   |
--vim.keymap.set('n', '<leader>', require('fzf-lua').lgrep_quickfix)   -- live grep the quickfix list                |
--vim.keymap.set('n', '<leader>', require('fzf-lua').lgrep_loclist)    -- live grep the location list                |
vim.keymap.set('n', '<leader>lp', require('fzf-lua').live_grep)        -- live grep current project                  |
--vim.keymap.set('n', '<leader>', require('fzf-lua').live_grep_resume) -- live grep continue last search             |
--vim.keymap.set('n', '<leader>', require('fzf-lua').live_grep_glob)   -- live_grep with `rg --glob` support         |
--vim.keymap.set('n', '<leader>', require('fzf-lua').live_grep_native) -- performant version of `live_grep`          |

-- live grep all open buffers
vim.keymap.set('n', '<leader>fg', function()
    local bufs = vim.api.nvim_list_bufs()
    local qflist = {}
    for _, buf in ipairs(bufs) do
        table.insert(qflist, { bufnr = buf })
    end
    vim.fn.setqflist(qflist, 'r')
    require('fzf-lua').lgrep_quickfix()
end)

-- run ':FzfLua files cwd=/search/dir'
