return {
  "coder/claudecode.nvim",
  lazy = false,
  keys = {
    { "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
    { "<leader>cf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude Code" },
    { "<leader>cr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude session" },
    { "<leader>ck", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude session" },
    { "<leader>cm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add buffer to Claude" },
    { "<leader>cs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection to Claude" },
    { "<leader>ca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept Claude diff" },
    { "<leader>cd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny Claude diff" },
  },
  opts = {},
}
