vim.lsp.enable({
    'clangd',
    'lua_ls',
    'pyright',
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user.lsp', {}),
  callback = function(args)
      vim.diagnostic.config({
          virtual_text = true,      -- show inline messages
          signs = true,             -- show signs in the gutter
          underline = true,         -- underline problematic text
          update_in_insert = false, -- don't update diagnostics while typing
          severity_sort = true,     -- sort diagnostics by severity
      })

      local function getKeymapOpts(desc)
          local keymapOpts = { noremap=true, silent=true, buffer=args.buf }
          keymapOpts['desc'] = 'lsp - ' .. desc
          return keymapOpts
      end

      vim.keymap.set('n',         'gl', vim.diagnostic.open_float,  getKeymapOpts('Display diagnostic in a float window'))
      vim.keymap.set('n', '<leader>lj', vim.diagnostic.goto_next,   getKeymapOpts('Diagnostic goto next'))
      vim.keymap.set('n', '<leader>lk', vim.diagnostic.goto_prev,   getKeymapOpts('Diagnostic goto prec'))
      vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist,  getKeymapOpts('Diagnostic set location list'))

      vim.keymap.set('n',          'K', vim.lsp.buf.hover,          getKeymapOpts('Displays hover information'))
      vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action,    getKeymapOpts('Selects a code action'))
      vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename,         getKeymapOpts('Rename'))
      vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, getKeymapOpts('Displays signature information about the symbol under the cursor'))
      vim.keymap.set('n',         'gD', vim.lsp.buf.declaration,    getKeymapOpts('Jumps to the declaration'))

      vim.keymap.set('n',         'gd', vim.lsp.buf.definition,     getKeymapOpts('Jumps to the definition'))
      vim.keymap.set('n',         'gr', vim.lsp.buf.references,     getKeymapOpts('Lists all the references to the symbol under the cursor in the quickfix window'))

      local client = vim.lsp.get_client_by_id(args.data.client_id)

      if client.name == 'clangd' then
          local inline_pattern = '_inline.h'

          vim.keymap.set('n', '<leader>ss', function()
              local file_base = vim.fn.expand('%:p:r') -- full path without file extension
              local file_ext = vim.fn.expand('%:e')
              local inline_file = (string.sub(vim.fn.expand('%:p'), -#inline_pattern) == inline_pattern)

              -- only handle files in the same directory.
              -- source -> header -> inline
              local new_name = nil
              if (inline_file) then
                  new_name = string.sub(vim.fn.expand('%:p'), 1, -#inline_pattern - 1) .. '.cpp'
                  if (vim.fn.filereadable(new_name) ~= 1) then
                      new_name = string.sub(vim.fn.expand('%:p'), 1, -#inline_pattern - 1) .. '.h'
                  end
              elseif (file_ext == 'cpp' or file_ext == 'c') then
                  new_name = file_base .. '.h'
                  if (vim.fn.filereadable(new_name) ~= 1) then
                      new_name = file_base .. inline_pattern
                  end
              elseif (file_ext == 'h') then
                  new_name = file_base .. inline_pattern
                  if (vim.fn.filereadable(new_name) ~= 1) then
                      new_name = file_base .. '.cpp'
                  end
              end

              if (new_name ~= nil) then
                  if (vim.fn.filereadable(new_name) == 1) then
                      vim.cmd('e ' .. new_name)
                  else
                      print(new_name .. ' not found')
                  end
              end
          end,
          getKeymapOpts('Switches between C++ source, header, and _inline files'))
      end

      if client:supports_method('textDocument/implementation') then
          -- Create a keymap for vim.lsp.buf.implementation ...
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, getKeymapOpts('Lists all the implementations'))
      end

      if client:supports_method('textDocument/completion') then
          vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
      end
  end
})

