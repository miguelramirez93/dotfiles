vim.g.material_style = "oceanic"

require("themer").setup({})

vim.cmd [[
try
  colorscheme themer_onedark
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
