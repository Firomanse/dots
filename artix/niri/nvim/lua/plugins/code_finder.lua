return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-telescope/telescope-file-browser.nvim',
  },
  config = function()
    require('telescope').load_extension('file_browser')
    require('telescope').load_extension('noice')
    require('telescope').load_extension('notify')
  end,
}
