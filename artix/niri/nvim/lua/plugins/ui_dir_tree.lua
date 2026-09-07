return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  init = function()
    api.nvim_create_autocmd("BufEnter", {
      group = api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
      desc = "Open Neo-tree if arg is directory",
      once = true,
      callback = function()
        if package.loaded["neo-tree"] then
          return
        end
        local argv0 = fn.argv(0)
        if argv0 == "" then
          return
        end
        local stats = uv.fs_stat(argv0)
        if stats and stats.type == "directory" then
          require("neo-tree")
        end
      end,
    })
  end,
  opts = {
    sources = { "filesystem", "buffers", "git_status" },
    open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitignored = false,
      },
      use_libuv_file_watcher = true,
    },
    window = {
      position = "left",
      width = 33,
      mappings = {
        ["l"] = "open",
        ["h"] = "close_node",
        ["<space>"] = "none",
        ["Y"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
          end,
          desc = "Copy Path to Clipboard",
        },
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
      },
      git_status = {
        symbols = {
          unstaged = "󰄱",
          staged = "󰱒",
          ignored   = "󱋭",
        },
      },
    },
    config = function(_, opts)
      api.nvim_create_autocmd("FileType", {
        pattern = "neo-tree",
        callback = function()
          vim.opt_local.statusline = " "
        end,
      })
      require("neo-tree").setup(opts)
    end,
  },
}
