-- Not tied to a single language: typos_lsp has no `filetypes` restriction by
-- default, so it attaches to every buffer and reports typos as diagnostics
-- alongside whatever language server is also active.
return {
	lsp = { name = "typos_lsp" },
}
