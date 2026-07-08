return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = { "ToggleTerm", "ToggleTermToggleAll" },
  keys = {
    { "<leader>t", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
  },
  opts = {
    open_mapping = [[<leader>t]],
    direction = "float",
    float_opts = {
      border = "curved",
    },
  },
}
