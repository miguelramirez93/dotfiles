--TODO move this to a central module
local mapper = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true } )
end


--LSP
mapper("n", "ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
mapper("n", "gv", ":vsplit | lua vim.lsp.buf.definition()<CR>")
mapper("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>")

