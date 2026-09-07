return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      mode = "buffers",
      themable = true,
      numbers = "none",
      indicator = { style = "icon", icon = "▎" },
      diagnostics = false,
      offsets = {
        {
          filetype = "neo-tree",
          separator = true,
          test = "File Explorer",
          test_align = "left",
        },
      },
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      close_command = "bdelete! %d",
      left_mouse_command = "buffer %d",
      color_icons = true,
      sort_by = "insert_after_current",
    },
  },
}
