local signs = {
  [vim.diagnostic.severity.ERROR] = vim.fn.nr2char(0xf057),
  [vim.diagnostic.severity.WARN] = vim.fn.nr2char(0xf071),
  [vim.diagnostic.severity.INFO] = vim.fn.nr2char(0xf05a),
  [vim.diagnostic.severity.HINT] = vim.fn.nr2char(0xf0eb),
}
vim.diagnostic.config({
  signs = { text = signs },
})

-- Handle jar: URIs for Clojure dependency navigation
-- Must populate buffer synchronously so LSP cursor placement works
vim.api.nvim_create_autocmd("BufReadCmd", {
  pattern = "*jar:file://*",
  callback = function(ev)
    local jar, entry = ev.match:match("jar:file://(.+)!/?(.+)$")
    if not jar or not entry then
      return
    end

    local content = vim.fn.system({ "unzip", "-p", jar, entry })
    if vim.v.shell_error ~= 0 then
      -- Put at least one line so cursor placement doesn't fail
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

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>h", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "gv", function()
      vim.cmd("vsplit")
      vim.lsp.buf.definition()
    end, opts)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method("textDocument/documentHighlight") then
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = ev.buf,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd("CursorMoved", {
        buffer = ev.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})
