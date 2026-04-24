vim.o.showtabline = 2

function _G.custom_tabline()
  local s = "%#TabLineFill#  "
  for i = 1, vim.fn.tabpagenr("$") do
    local bufnr = vim.fn.tabpagebuflist(i)[vim.fn.tabpagewinnr(i)]
    local name = vim.fn.fnamemodify(vim.fn.bufname(bufnr), ":t")
    if name == "" then
      name = "[No Name]"
    end
    local modified = vim.fn.getbufvar(bufnr, "&modified") == 1 and " ●" or ""
    local hl = i == vim.fn.tabpagenr() and "%#TabLineSel#" or "%#TabLine#"
    if i > 1 then
      s = s .. "%#TabLine#│"
    end
    s = s .. hl .. " " .. name .. modified .. " "
  end
  return s .. "%#TabLineFill#"
end

vim.o.tabline = "%!v:lua.custom_tabline()"
