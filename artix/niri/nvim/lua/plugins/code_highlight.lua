return {
  'nvim-treesitter/nvim-treesitter',
  version = false,
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      'asm',  'bash',  'c', 'cpp',
      'make', 'cmake', 'c_sharp',
      'html', 'css',   'javascript',
      'json', 'jsonc', 'php', 'hyprlang',
      'lua',  'sql',   'xml', 'yaml',
      'vim',  'vimdoc', 'markdown',
      'markdown_inline', 'gitcommit'
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = false },
  },
}
