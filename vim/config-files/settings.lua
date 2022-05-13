local o = vim.o
local wo = vim.wo
local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

g.go_def_mapping_enabled = 0
g.go_doc_keywordprg_enabled = 0
g.airline_powerline_fonts = 1
opt.termguicolors = true
o.mouse = 'a'
o.updatetime = 50
g.coc_global_extensions = { 'coc-tsserver', 'coc-prettier', 'coc-eslint', 'coc-metals', 'coc-go', 'coc-pyright', 'coc-vetur', 'coc-json' }
cmd[[
    syntax enable
    colorscheme PaperColor
    set cursorline
    

    let g:coc_global_extensions = [ 'coc-tsserver', 'coc-prettier', 'coc-eslint', 'coc-metals', 'coc-go', 'coc-pyright', 'coc-vetur', 'coc-json' ]

    set nobackup                            
    set nowritebackup
]]



wo.number = true
wo.wrap = false

o.clipboard = "unnamedplus"
o.lazyredraw = true
o.splitright = true


require('gitsigns').setup()