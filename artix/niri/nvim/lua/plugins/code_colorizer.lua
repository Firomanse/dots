return {
  'norcalli/nvim-colorizer.lua',
  event = 'BufReadPre',
  opts = {
    "*",
    css  = { rgb_fn = true },
    html = { names = false },
  },
}
