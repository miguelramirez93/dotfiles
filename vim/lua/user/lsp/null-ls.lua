local null_ls_status_ok, null_ls = pcall(require, "null-ls")
local globals                    = require("user.globals")
if not null_ls_status_ok then
	return
end
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = null_ls.builtins.diagnostics


local M = {}

function M.setup()
  null_ls.setup({
    debug = false,
    on_attach = M.on_attach,
    sources = M.sources,
    update_in_insert = globals.update_in_insert,
  })
end

M.formatting = null_ls.builtins.formatting
M.code_actions = null_ls.builtins.code_actions
M.diagnostics = null_ls.builtins.diagnostics
M.completion = null_ls.builtins.completion

M.sources = {
    M.formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    M.formatting.black.with({ extra_args = { "--fast" } }),
    --formatting.stylua,
    M.formatting.eslint_d,
    --formatting.lua_format,
    M.formatting.autopep8,
    --formatting.golines,
    --diagnostics.golangci_lint,
    --diagnostics.staticcheck,
    M.diagnostics.misspell,
    M.diagnostics.pylint,
    M.code_actions.eslint_d,
    M.completion.spell,
    -- M.diagnostics.flake8,
}



function M.on_attach(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
            vim.lsp.buf.formatting_sync()
        end,
    })
  end
end


return M
