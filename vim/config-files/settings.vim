" set leader key
" let g:mapleader = "\<Space>" maybe latter

set termguicolors
syntax enable                           " Enables syntax highlighing

" gruvbox theme config
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_material_background = 'soft'
colorscheme gruvbox-material
" coc init config
let g:coc_global_extensions = [ 'coc-tsserver', 'coc-prettier', 'coc-eslint', 'coc-metals', 'coc-go', 'coc-pyright', 'coc-vetur' ]

" go config
let g:go_def_mapping_enabled = 0

" ack config
let g:ackprg = 'ag --nogroup --nocolor --column'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" ctrlP config
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" vifm
" if executable('vifm')
"  let g:loaded_netrw       = 1
"  let g:loaded_netrwPlugin = 1
"
"  let g:vifm_replace_netrw = 1
"endif

" Lua plugins config
" autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
let g:go_doc_keywordprg_enabled = 0
lua << END
require('gitsigns').setup()
require("toggleterm").setup{
  open_mapping = [[<c-j>]],
}
END


" nvim settings
" set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
" set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=150                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set shell=/bin/bash                     " Set bash as default shell always
set encoding=utf-8
"set autochdir                           " Your working directory will always be the same as your working directory


" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" You can't stop me
cmap w!! w !sudo tee %


" NERDTree
" Close NERDTree when opening a file
let g:NERDTreeQuitOnOpen = 1
" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufRead * call SyncTree()
