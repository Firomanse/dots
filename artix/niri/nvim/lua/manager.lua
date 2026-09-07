--- bootstrap ---
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim' --path to lazy plugin

if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--single-branch',
    'https://github.com/folke/lazy.nvim.git',
    lazypath
  }) --git clone to plugin
end
vim.opt.runtimepath:prepend(lazypath)
--- bootstrap end ---


require('lazy').setup('plugins', {
  --shows progress and logs
  change_detection = {
    notify = false
  },
  ui = {
    border = "rounded"
  },
  rocks = { enabled = false },
})
