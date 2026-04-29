return {
  "Olical/conjure",
  ft = { "clojure", "fennel" },
  init = function()
    vim.g["conjure#mapping#doc_word"] = false
  end,
  config = function()
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = "*.clj",
      command = ":ConjureEvalBuf",
    })
  end,
}
