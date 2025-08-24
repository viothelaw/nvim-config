vim.pack.add({
    { src = 'https://github.com/nvim-lualine/lualine.nvim' },
})

require('lualine').setup({
    options = {
        icons_enabled = false,
        globalstatus = false,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'diagnostics', 'filename'},
        lualine_c = { function()
            local status_lsp_progress_ok, lsp_progress = pcall(require, 'lsp-progress')
            if status_lsp_progress_ok then
                return lsp_progress.progress()
            else
                return ''
            end
        end },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = { {'filename', file_status = true, path = 2 }}, -- path 0 = filename, 1 = relative path, 2 = absolute path
        lualine_c = {},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
})


