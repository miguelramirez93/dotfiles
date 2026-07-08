return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewRefresh",
    "DiffviewFileHistory",
  },
  opts = {
    enhanced_diff_hl = true,
    view = {
      merge_tool = {
        layout = "diff3_mixed",
        disable_diagnostics = true,
      },
    },
  },
  keys = {
    { "<leader>gdo", "<cmd>DiffviewOpen<cr>", desc = "Diffview: open" },
    { "<leader>gdc", "<cmd>DiffviewClose<cr>", desc = "Diffview: close" },
    { "<leader>gdh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: file history (current file)" },
    { "<leader>gdH", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview: branch history" },
  },
}
