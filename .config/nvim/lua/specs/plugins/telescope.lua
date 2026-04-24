return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
    { "<leader>sg", function() require("telescope.builtin").live_grep() end, desc = "Grep Search" },
    { "<leader>,", function() require("telescope.builtin").buffers() end, desc = "Switch Buffer" },
    { "<leader>ss", function() require("telescope.builtin").lsp_document_symbols() end, desc = "Document Symbols" },
  },
}
