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

      local keymapOpts = { noremap=true, silent=true, buffer=args.buf }

      vim.keymap.set('n',         'gl', vim.diagnostic.open_float,  keymapOpts)
      vim.keymap.set('n', '<leader>lj', vim.diagnostic.goto_next,   keymapOpts)
      vim.keymap.set('n', '<leader>lk', vim.diagnostic.goto_prev,   keymapOpts)
      vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist,  keymapOpts)

      vim.keymap.set('n',          'K', vim.lsp.buf.hover,          keymapOpts)
      vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action,    keymapOpts)
      vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename,         keymapOpts)
      vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, keymapOpts)
      vim.keymap.set('n',         'gD', vim.lsp.buf.declaration,    keymapOpts)

      vim.keymap.set('n',         'gd', vim.lsp.buf.definition,     keymapOpts)
      vim.keymap.set('n',         'gr', vim.lsp.buf.references,     keymapOpts)

      local client = vim.lsp.get_client_by_id(args.data.client_id)

      if client:supports_method('textDocument/implementation') then
          -- Create a keymap for vim.lsp.buf.implementation ...
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation,    keymapOpts)
      end

      if client:supports_method('textDocument/switchSourceHeader') then
          if client.name == 'clangd' then
              vim.keymap.set('n', '<leader>ss', '<cmd>LspClangdSwitchSourceHeader<cr>', keymapOpts)
          end
      end

      if client:supports_method('textDocument/completion') then
          local function pumvisible()
              return tonumber(vim.fn.pumvisible()) ~= 0
          end

          vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
          vim.opt.completeopt = { 'menuone', 'noselect', 'popup' }

          vim.keymap.set('i', '<C-j>', function() return pumvisible() and '<C-n>' or '<C-j>' end, { expr = true, buffer=args.buf })
          vim.keymap.set('i', '<C-k>', function() return pumvisible() and '<C-p>' or '<C-k>' end, { expr = true, buffer=args.buf })
      end
  end
})

