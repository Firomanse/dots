return {
  'hrsh7th/nvim-cmp',
  event = 'Insertenter',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-emoji',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lsp-document-symbol',
    'hrsh7th/cmp-nvim-lua',
    'saadparwaiz1/cmp_luasnip',
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ['<CR>']      = cmp.config.disable,
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-k>']     = cmp.mapping.scroll_docs(-2),
        ['<C-j>']     = cmp.mapping.scroll_docs(2),
        ['<C-e>']     = cmp.mapping.abort(),
        ['<Tab>']     = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end,
        ['<S-Tab>']   = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.expand_or_jumpable(-1) then
            luasnip.expand_or_jump(-1)
          else
            fallback()
          end
        end,
        ["<Up>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.close()
          end
          fallback()
        end, { "i", "s" }),

        ["<Down>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.close()
          end
          fallback()
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = 'buffer'   },
        { name = 'path'     },
        { name = 'emoji'    },
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help'  },
        { name = 'nvim_lsp_document_symbol' },
        { name = 'nvim_lua' },
      },
      {
        { name = 'luasnip' },
      }),
    })
  end,
}
