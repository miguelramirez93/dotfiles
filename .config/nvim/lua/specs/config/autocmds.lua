vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.clj",
  command = ":ConjureEvalBuf",
})
