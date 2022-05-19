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

    " autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]]



wo.number = true
wo.wrap = false

o.clipboard = "unnamedplus"
o.lazyredraw = true
o.splitright = true


require('gitsigns').setup()

require'nvim-tree'.setup {
	update_focused_file = {
	    enable = true,
	    update_cwd = false,
	    ignore_list = {},
	},
	actions = {
	    use_system_clipboard = true,
	    change_dir = {
	      enable = true,
	      global = false,
	      restrict_above_cwd = false,
	    },
	    open_file = {
	      quit_on_open = true,
	      resize_window = false,
	      window_picker = {
		enable = false,
		chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
		exclude = {
		  filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
		  buftype = { "nofile", "terminal", "help" },
		},
	      },
	    },
	  },
  }


