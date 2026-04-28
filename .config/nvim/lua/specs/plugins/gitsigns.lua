return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  opts = {},
  keys = {
    {
      "<leader>gd",
      function()
        require("gitsigns").preview_hunk()
      end,
      desc = "Preview git hunk",
    },
  },
}
