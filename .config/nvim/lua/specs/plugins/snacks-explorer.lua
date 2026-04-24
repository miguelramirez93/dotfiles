return {
  "folke/snacks.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    explorer = {
      enabled = true,
      replace_netrw = true,
    },
    picker = {
      enabled = true,
      sources = {
        explorer = {
          auto_close = true,
        },
      },
    },
  },
  keys = {
    { "<leader>e", function() Snacks.explorer({ focus_file = vim.api.nvim_buf_get_name(0) }) end, desc = "File Explorer" },
  },
}
