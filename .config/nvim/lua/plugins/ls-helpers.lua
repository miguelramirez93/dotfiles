return {
  {
    "crispgm/nvim-go",
    opts = {
      auto_lint = false,
      linter = "staticcheck",
      lint_prompt_style = "vt",
      test_popup = true,
      test_popup_auto_leave = false,
      test_popup_width = 240,
      test_popup_height = 30,
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
