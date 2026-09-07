return {
  -- Mason: installs and manages external tools like LSP servers
  {
    'mason-org/mason.nvim',
    opts = {},
  },

  -- Mason-LSPConfig: tells Mason which servers to install and links them to lspconfig
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        'lua_ls', -- Lua (great for editing Neovim config)
        'clangd', -- C / C++
        -- 'csharp_ls',
      },
    },
  },

  -- nvim-lspconfig: connects Neovim to installed LSP servers
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client, bufnr)
        --local keys for lsp-actions
        local opts = { buffer = bufnr, silent = true }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "K",  vim.lsp.buf.hover, opts)
      end

      vim.lsp.config.lua_ls = {
        on_attach = on_attach,
        capabilities = capabilities,
      }
      vim.lsp.config.clangd = {
        cmd = {
          "clangd",
          "--background-index",           -- Для автодополнения
          "--compile-commands-dir=build", -- Для поиска путей к заголовкам
          "--all-scopes-completion",
        },
        on_attach = on_attach,
        capabilities = capabilities,
      }
      vim.lsp.config.csharp_ls = {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      vim.api.nvim_create_autocmd("User", {
        pattern = "LspAttached",
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
        end,
      })
    end,
  },
}
