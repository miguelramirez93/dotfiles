" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + yuio to resize windows
nnoremap <M-q>    :resize -2<CR>
nnoremap <M-w>    :resize +2<CR>
nnoremap <M-e>    :vertical resize -2<CR>
nnoremap <M-r>    :vertical resize +2<CR>

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" Easy CAPS
" inoremap <c-u> <ESC>viwUi
" nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-u> <C-w>k
" nnoremap <C-k> <C-w>l

" Better tab management
nnoremap <C-t> :tabnew<CR>


nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

" Better move-lines shortcuts
nnoremap <A-k> :m .+1<CR>==
nnoremap <A-j> :m .-2<CR>==
inoremap <A-k> <Esc>:m .+1<CR>==gi
inoremap <A-j> <Esc>:m .-2<CR>==gi
vnoremap <A-k> :m '>+1<CR>gv=gv
vnoremap <A-j> :m '<-2<CR>gv=gv


"crtP maps
let g:ctrlp_map = '<c-p>'


" coc maps
nnoremap <silent> K :call CocAction('doHover')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gv :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent>ca <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)
inoremap <silent><expr> <c-space> coc#refresh()

" telescope maps
nnoremap <C-p> :Telescope find_files<CR>
nnoremap <C-f> :Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

" NERDTree
map <silent> <C-b> :NERDTreeToggle<CR>
