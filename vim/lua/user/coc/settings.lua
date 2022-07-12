local M = {}

M.extensions = {
  'coc-tsserver',
  'coc-prettier',
  'coc-eslint',
  'coc-metals',
  'coc-go',
  'coc-pyright',
  'coc-vetur',
  'coc-json',
  'coc-jest',
  'coc-lua',
  'coc-snippets',
  'coc-pairs',
  'coc-spell-checker'
}

function M.setup()
  vim.g.coc_global_extensions = M.extensions
end

return M
