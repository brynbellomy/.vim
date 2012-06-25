call pathogen#infect()

colorscheme lucius

"Filetype
"set filetype=on
filetype plugin on
filetype indent on

syntax enable

" Large paste helper
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Tab stuff
nnoremap <silent> <Leader>[ :tabprevious<CR>
nnoremap <silent> <Leader>] :tabnext<CR>

" JSON files are javascript
autocmd BufNewFile,BufRead *.json set ft=javascript

" enable mouse for fast gestural scrolling
set mouse=a

" fuzzy search
nnoremap <C-f><C-f> :FufFile<CR>

" ctags stuff
nnoremap <silent> <F9> :TagbarToggle<CR>

let g:syntastic_javascript_checker='jshint'

" Proper Ctags locations
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_type_javascript = {
    \ 'ctagsbin' : '/usr/local/bin/jsctags'
\ }

" Default is 40, seems too wide
" let g:tagbar_width=26

set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.node                           " Node.js native modules
set wildignore+=*.pyc 


"Map NERDTree file browser to \p
nmap <silent> <Leader>p :NERDTreeToggle<CR>
"autopen NERDTree and focus cursor in new document  
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p  
let NERDTreeShowHidden=1
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
" this will make nerdtree disappear when the last buffer is gone
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


"Show line number
set number

"Higlight current line only in insert mode
autocmd InsertLeave * set nocursorline
autocmd InsertEnter * set cursorline

"Highlight cursor
highlight CursorLine ctermbg=8 cterm=NONE

"Incremental search
set incsearch
"Highlight all matches
set hlsearch

set ai
set ts=4
set sts=4
set et
set sw=4
set textwidth=79

set ttyfast
set nocompatible
set autoindent
set lbr
set showcmd
set backspace=indent,eol,start
set noswapfile


" HTML (tab width 2 chr, no wrapping)
autocmd FileType html set sw=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2
autocmd FileType html set textwidth=0
" handlebars (tab width 2 chr, no wrapping)
autocmd FileType html set sw=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2
autocmd FileType html set textwidth=0
" Python (tab width 4 chr, wrap at 79th char)
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
autocmd FileType python set textwidth=79
" CSS (tab width 2 chr, wrap at 79th char)
autocmd FileType css set sw=2
autocmd FileType css set ts=2
autocmd FileType css set sts=2
autocmd FileType css set textwidth=79
" JavaScript (tab width 2 chr, wrap at 79th)
autocmd FileType javascript set sw=2
autocmd FileType javascript set ts=2
autocmd FileType javascript set sts=2
autocmd FileType javascript set textwidth=0

autocmd FileType php set sw=2
autocmd FileType php set ts=2
autocmd FileType php set sts=2
autocmd FileType php set textwidth=0

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

autocmd FileType handlebars set textwidth=0

" Highlight 81 column
set colorcolumn=81
:highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

" ctrlp options
let g:ctrlp_working_path_mode = 2

autocmd FileType javascript set dictionary-=~/.vim/bundle/vim-node/dict/node.dict dictionary+=~/.vim/bundle/vim-node/dict/node.dict


set foldmethod=syntax
