vim.pack.add({
    { src = 'https://github.com/akinsho/bufferline.nvim' },
})

-- bufferline requires truecolors. Make it somewhat usable for non-true-color terminal.
local highlights_opt = {}
if (not vim.api.nvim_get_option_value('termguicolors', {})) then
    local nfg = 0       -- for normal forground (inverted)
    local nbg = 244     -- for normal background (inverted)
    local sfg = 244     -- for selected forground (inverted)
    local sbg = 0       -- for selected background (inverted)
    highlights_opt = {
            fill =                          { ctermfg = nfg, ctermbg = nbg, },
            background =                    { ctermfg = nfg, ctermbg = nbg, },
            tab =                           { ctermfg = nfg, ctermbg = nbg, },
            tab_selected =                  { ctermfg = sfg, ctermbg = sbg, },
            tab_separator =                 { ctermfg = nfg, ctermbg = nbg, },
            tab_separator_selected =        { ctermfg = sfg, ctermbg = sbg, },
            tab_close =                     { ctermfg = nfg, ctermbg = nbg, },
            close_button =                  { ctermfg = nfg, ctermbg = nbg, },
            close_button_visible =          { ctermfg = nfg, ctermbg = nbg, },
            close_button_selected =         { ctermfg = sfg, ctermbg = sbg, },
            buffer_visible =                { ctermfg = nfg, ctermbg = nbg, },
            buffer_selected =               { ctermfg = sfg, ctermbg = sbg, italic = true, bold = true, },
            numbers =                       { ctermfg = nfg, ctermbg = nbg, },
            numbers_visible =               { ctermfg = nfg, ctermbg = nbg, },
            numbers_selected =              { ctermfg = sfg, ctermbg = sbg, italic = true, bold = true, },
            diagnostic =                    { ctermfg = nfg, ctermbg = nbg, },
            diagnostic_visible =            { ctermfg = nfg, ctermbg = nbg, },
            diagnostic_selected =           { ctermfg = sfg, ctermbg = sbg, italic = true, bold = true, },
            hint =                          { ctermfg = nfg, ctermbg = nbg, },
            hint_visible =                  { ctermfg = nfg, ctermbg = nbg, },
            hint_selected =                 { ctermfg = sfg, ctermbg = sbg, italic = true, bold = true, },
            hint_diagnostic =               { ctermfg = nfg, ctermbg = nbg, },
            hint_diagnostic_visible =       { ctermfg = nfg, ctermbg = nbg, },
            hint_diagnostic_selected =      { ctermfg = sfg, ctermbg = sbg, italic = true, bold = true, },
            info =                          { ctermfg = nfg, ctermbg = nbg, },
            info_visible =                  { ctermfg = nfg, ctermbg = nbg, },
            info_selected =                 { ctermfg = sfg, ctermbg = sbg, italic = true, bold = true, },
            info_diagnostic =               { ctermfg = nfg, ctermbg = nbg, },
            info_diagnostic_visible =       { ctermfg = nfg, ctermbg = nbg, },
            info_diagnostic_selected =      { ctermfg = sfg, ctermbg = sbg, italic = true, bold = true, },
            warning =                       { ctermfg = nfg, ctermbg = nbg, },
            warning_visible =               { ctermfg = nfg, ctermbg = nbg, },
            warning_selected =              { ctermfg = sfg, ctermbg = sbg, italic = true, bold = true, },
            warning_diagnostic =            { ctermfg = nfg, ctermbg = nbg, },
            warning_diagnostic_visible =    { ctermfg = nfg, ctermbg = nbg, },
            warning_diagnostic_selected =   { ctermfg = sfg, ctermbg = sbg, italic = true, bold = true, },
            error =                         { ctermfg = nfg, ctermbg = nbg, },
            error_visible =                 { ctermfg = nfg, ctermbg = nbg, },
            error_selected =                { ctermfg = sfg, ctermbg = sbg, italic = true, bold = true, },
            error_diagnostic =              { ctermfg = nfg, ctermbg = nbg, },
            error_diagnostic_visible =      { ctermfg = nfg, ctermbg = nbg, },
            error_diagnostic_selected =     { ctermfg = sfg, ctermbg = sbg, italic = true, bold = true, },
            modified =                      { ctermfg = nfg, ctermbg = nbg, },
            modified_visible =              { ctermfg = nfg, ctermbg = nbg, },
            modified_selected =             { ctermfg = sfg, ctermbg = sbg, },
            duplicate_selected =            { ctermfg = sfg, ctermbg = sbg, italic = true, },
            duplicate_visible =             { ctermfg = nfg, ctermbg = nbg, italic = true, },
            duplicate =                     { ctermfg = nfg, ctermbg = nbg, italic = true, },
            separator_selected =            { ctermfg = sfg, ctermbg = sbg, },
            separator_visible =             { ctermfg = nfg, ctermbg = nbg, },
            separator =                     { ctermfg = nfg, ctermbg = nbg, },
            indicator_visible =             { ctermfg = nfg, ctermbg = nbg, },
            indicator_selected =            { ctermfg = sfg, ctermbg = sbg, },
            pick_selected =                 { ctermfg = sfg, ctermbg = sbg, italic = true, bold = true, },
            pick_visible =                  { ctermfg = nfg, ctermbg = nbg, italic = true, bold = true, },
            pick =                          { ctermfg = nfg, ctermbg = nbg, italic = true, bold = true, },
            offset_separator =              { ctermfg = nfg, ctermbg = nbg, },
            trunc_marker =                  { ctermfg = nfg, ctermbg = nbg, }
    }
end

require('bufferline').setup({
    options = {
        mode = 'buffers', -- set to 'tabs' to only show tabpages instead
        numbers = 'buffer_id', -- 'both' for both ordianl & buffer_id
        themable = true,
        show_buffer_icons = false, -- disable filetype icons for buffers (left of file name)
        show_buffer_close_icons = false, -- (right of file name)
        show_close_icon = false,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        separator_style = { '║', '║' },
        indicator = { -- set active buffer indicator
            icon = '➡️', -- alternative icons ➡️ 🔷 ❖ 💠 👁‍🗨 ⛧⃝
            style = 'none', -- don't use icon
        },
    },
    highlights = highlights_opt;
})
