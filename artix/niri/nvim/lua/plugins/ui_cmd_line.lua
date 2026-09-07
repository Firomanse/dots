return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  init = function()
    g.lualine_laststatus = o.laststatus
  end,
  opts = function()
    o.laststatus = g.lualine_laststatus

    local opts = {
      options = {
        theme = 'auto',
        globalstatus = o.laststatus == 3,
        disabled_filetypes = {
          statusline = { "dashboard", "alpha", "ministarter", "neo-tree" }
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "filetype",
            icon_only = true,
            separator = "",
            padding = { left = 1, right = 0 }
          },
        },
        lualine_x = {
          { "progress" },
          { "location" },
        },
        lualine_y = {
          function()
            return " " .. os.date("%R")
          end,
        },
      },
    }
    return opts
  end,
}
