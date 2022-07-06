vim.g.material_style = "oceanic"

require("themer").setup({})

local selected_color_scheme = "darkplus"

local set_theme_cmd = [[
try
  colorscheme $selected
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

set_theme_cmd = set_theme_cmd:gsub("$selected", selected_color_scheme)

vim.cmd(set_theme_cmd)

return selected_color_scheme
