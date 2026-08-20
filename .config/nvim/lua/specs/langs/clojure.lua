local filetypes = { "clojure", "clojurescript", "edn" }

-- clojure-lsp points definitions inside dependency jars to
-- `zipfile://<jar>::<entry>` URIs (some setups instead use
-- `jar:file://<jar>!/<entry>`). Neovim's built-in zipPlugin would normally
-- read the `zipfile://` scheme, but it's disabled for startup performance
-- (see platform/clients/lazy.lua), so `gd` into stdlib/library code fails
-- silently unless we populate the buffer ourselves.
local function setup_jar_uri_reader()
	vim.api.nvim_create_autocmd("BufReadCmd", {
		pattern = { "zipfile://*", "*jar:file://*" },
		callback = function(ev)
			local jar, entry = ev.match:match("^zipfile://(.+)::(.+)$")
			if not jar then
				jar, entry = ev.match:match("jar:file://(.+)!/?(.+)$")
			end
			if not jar or not entry then
				return
			end

			local content = vim.fn.system({ "unzip", "-p", jar, entry })
			if vim.v.shell_error ~= 0 then
				vim.api.nvim_buf_set_lines(ev.buf, 0, -1, false, { "-- Failed to read: " .. entry })
				vim.bo[ev.buf].buftype = "nofile"
				return
			end

			local lines = vim.split(content, "\n", { trimempty = true })
			if #lines == 0 then
				lines = { "" }
			end

			vim.api.nvim_buf_set_lines(ev.buf, 0, -1, false, lines)
			vim.bo[ev.buf].buftype = "nofile"
			vim.bo[ev.buf].modifiable = false
			vim.bo[ev.buf].readonly = true
			vim.bo[ev.buf].swapfile = false

			local ext = entry:match("%.(%w+)$")
			if ext then
				local ft_map = { clj = "clojure", cljs = "clojurescript", cljc = "clojure", edn = "clojure" }
				vim.bo[ev.buf].filetype = ft_map[ext] or ext
			end
		end,
	})
end

-- Mirrors `lein lint-fix` (plug-n-play), which runs clojure-lsp's own
-- `clean-ns` and `format` commands rather than a standalone cljfmt binary.
-- Formatting is left to conform's LSP fallback (clojure_lsp handles it,
-- reading style config from the project's .lsp/config.edn classpath-config-paths
-- the same way `lein lint-fix` does); `clean-ns` has no standard LSP method,
-- so it's wired as a custom executeCommand behind a keymap.
local function clean_ns(bufnr)
	local client = vim.lsp.get_clients({ bufnr = bufnr, name = "clojure_lsp" })[1]
	if not client then
		return
	end
	client:exec_cmd({
		command = "clean-ns",
		arguments = { vim.uri_from_bufnr(bufnr), 0, 0 },
	}, { bufnr = bufnr })
end

return {
	filetypes = filetypes,
	lsp = {
		name = "clojure_lsp",
		config = { filetypes = filetypes },
	},
	on_attach = function(bufnr)
		vim.keymap.set("n", "<leader>cn", function()
			clean_ns(bufnr)
		end, { buffer = bufnr, silent = true, desc = "Clean namespace (clojure-lsp)" })
	end,
	setup = setup_jar_uri_reader,
}
