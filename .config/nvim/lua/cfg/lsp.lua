vim.diagnostic.config({
	virtual_text = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
	},
	underline = true,
})

local sign_define = function(opts)
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		text = opts.text,
		numhl = "",
	})
end

sign_define({ name = "DiagnosticSignError", text = "✘" })
sign_define({ name = "DiagnosticSignWarn", text = "▲" })
sign_define({ name = "DiagnosticSignHint", text = "⚑" })
sign_define({ name = "DiagnosticSignInfo", text = "»" })
