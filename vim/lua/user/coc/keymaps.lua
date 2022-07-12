local keymaps_utils = require('user.utils.keymaps')

local M = {}

function M.setup()
  keymaps_utils.map("n", "K", ":call CocAction('doHover')<CR>")
  keymaps_utils.map("n", "gd", "<Plug>(coc-definition)")
  keymaps_utils.map("n", "gv", ":call CocAction('jumpDefinition', 'vsplit')<CR>")
  keymaps_utils.map("n", "gy", "<Plug>(coc-type-definition)")
  keymaps_utils.map("n", "gr", "<Plug>(coc-references)")
  keymaps_utils.map("n", "ca", "<Plug>(coc-codeaction)")
  keymaps_utils.map("n", "rn", "<Plug>(coc-rename)")
  vim.cmd[[
      inoremap <silent><expr> <c-space> coc#refresh()
  ]]
end

return M
