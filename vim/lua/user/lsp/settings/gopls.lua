return {
  on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
  end,
  settings = {
    name = 'go-lang',
    cmd = {'gopls', '--remote=auto'},
    whitelist= {'go'},
    analyses = {
      unusedparams = true,
    },
    staticcheck = true,
    gofumpt = true,
  }
}
