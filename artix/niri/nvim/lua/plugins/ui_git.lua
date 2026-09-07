return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add          = { text = "│" },
      change       = { text = "│" },
      delete       = { text = "│" },
      topdelete    = { text = "‾" },
      changedelete = { text = "│" },
      untracked    = { text = "┆" },
    },
    signcolumn = true,
    watch_gitdir = {
      follow_files = true
    },
    auto_attach = true,
    sign_priority = 6,
    status_formatter = nil,
  },
}
