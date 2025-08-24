vim.pack.add({
    { src = 'https://github.com/nvim-telescope/telescope.nvim', version = '0.1.8' },
})

local action = require('telescope.actions')

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<C-j>'] = action.move_selection_next,
                ['<C-k>'] = action.move_selection_previous,
            },
            n = {
                ['<C-j>'] = action.move_selection_next,
                ['<C-k>'] = action.move_selection_previous,
            },
        },
        preview = {
            treesitter = false, -- prevent error from popping up.
        },
        path_display = {
            'smart',
        },
        layout_strategy = 'vertical',
    },
    pickers = {
        buffers              = { fname_width = 0.50 },
        diagnostic           = { fname_width = 0.50 },
        find_files           = { fname_width = 0.50 },
        live_grep            = { fname_width = 0.50 },
        lsp_definitions      = { fname_width = 0.50 },
        lsp_document_symbols = { fname_width = 0.50 },
        lsp_implementations  = { fname_width = 0.50 },
        lsp_incoming_calls   = { fname_width = 0.50 },
        lsp_outgoing_calls   = { fname_width = 0.50 },
        lsp_references       = { fname_width = 0.50 },
        tags                 = { fname_width = 0.50 },
    },

    extensions = {
        wrap_results = true,
    },
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>ft', builtin.git_files)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>/',  builtin.current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>gw', builtin.grep_string)

vim.keymap.set('n', '<leader>fa', function()
    ---@diagnostic disable-next-line: param-type-mismatch
    builtin.find_files { cwd = vim.fs.joinpath(vim.fn.stdpath 'data', 'lazy') }
end)

vim.keymap.set('n', '<leader>en', function()
    builtin.find_files { cwd = vim.fn.stdpath 'config' }
end)
