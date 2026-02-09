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

local function getKeymapOpts(desc)
    local keymapOpts = { noremap=true, silent=true }
    keymapOpts['desc'] = 'fzf-lua - ' .. desc
    return keymapOpts
end

local function findFilesInParentDir()
    require('fzf-lua').files({ cwd='..' })
end

local function findFilesByUserInput()
    vim.ui.input({ prompt = "Enter search path: " }, function(input_path)
        if input_path ~= nil and #input_path > 0 then
            if (vim.fn.isdirectory(input_path) == 1) then
                require('fzf-lua').files({ cwd=input_path })
            end
        end
    end)
end

local function findProjectFile()
    local workspace_folders = vim.lsp.buf.list_workspace_folders()
    local cwd = vim.fn.getcwd()

    if #workspace_folders > 0 then
        cwd = workspace_folders[1]
    end

    require('fzf-lua').files({ cwd=cwd })
end

local function liveGrepOpenBuffers()
    local bufs = vim.api.nvim_list_bufs()
    local qflist = {}
    for _, buf in ipairs(bufs) do
        table.insert(qflist, { bufnr = buf })
    end
    vim.fn.setqflist(qflist, 'r')
    require('fzf-lua').lgrep_quickfix()
end

-- find files by file names
vim.keymap.set('n', '<leader>fb', require('fzf-lua').buffers,             getKeymapOpts('find buffer'))
vim.keymap.set('n', '<leader>ff', require('fzf-lua').files,               getKeymapOpts('find files in current directory'))
vim.keymap.set('n', '<leader>fu', function() findFilesInParentDir() end,  getKeymapOpts('find files in parent directory'))
vim.keymap.set('n', '<leader>fi', function() findFilesByUserInput() end,  getKeymapOpts('Find files in user inputed directory'))
vim.keymap.set('n', '<leader>fp', function() findProjectFile() end,       getKeymapOpts('Find files in project root directory'))

-- find files by grep / live grep
--vim.keymap.set('n', '<leader>', require('fzf-lua').grep)                            -- search for a pattern with `grep` or `rg`   |
--vim.keymap.set('n', '<leader>', require('fzf-lua').grep_last)                       -- run search again with the last pattern     |
vim.keymap.set('n', '<leader>gw', require('fzf-lua').grep_cword,          getKeymapOpts('search word under cursor'))
vim.keymap.set('n', '<leader>gW', require('fzf-lua').grep_cWORD,          getKeymapOpts('search WORD under cursor'))
--vim.keymap.set('n', '<leader>', require('fzf-lua').grep_visual)                     -- search visual selection                    |
vim.keymap.set('n', '<leader>gp', require('fzf-lua').grep_project,        getKeymapOpts("search all project lines (fzf.vim's `:Rg`)"))
vim.keymap.set('n', '<leader>gb', require('fzf-lua').grep_curbuf,         getKeymapOpts('search current buffer lines'))
--vim.keymap.set('n', '<leader>', require('fzf-lua').grep_quickfix)                   -- search the quickfix list                   |
--vim.keymap.set('n', '<leader>', require('fzf-lua').grep_loclist)                    -- search the location list                   |
vim.keymap.set('n', '<leader>lb', require('fzf-lua').lgrep_curbuf,        getKeymapOpts('live grep current buffer'))
--vim.keymap.set('n', '<leader>', require('fzf-lua').lgrep_quickfix)                  -- live grep the quickfix list                |
--vim.keymap.set('n', '<leader>', require('fzf-lua').lgrep_loclist)                   -- live grep the location list                |
vim.keymap.set('n', '<leader>lp', require('fzf-lua').live_grep,           getKeymapOpts('live grep current project'))
--vim.keymap.set('n', '<leader>', require('fzf-lua').live_grep_resume)                -- live grep continue last search             |
--vim.keymap.set('n', '<leader>', require('fzf-lua').live_grep_glob)                  -- live_grep with `rg --glob` support         |
--vim.keymap.set('n', '<leader>', require('fzf-lua').live_grep_native)                -- performant version of `live_grep`          |

vim.keymap.set('n', '<leader>lg', function() liveGrepOpenBuffers() end,   getKeymapOpts('live grep all open buffers'))

-- run ':FzfLua files cwd=/search/dir'
