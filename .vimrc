call pathogen#infect()

set guioptions=egmrLt
set guifont=Consolas:h16

"Filetype
"set filetype=on
filetype plugin on
filetype indent on

colorscheme Spacedust
syntax enable

" Large paste helper
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" selection behavior
set selection=exclusive

" line wrap toggle
nnoremap <Leader>w :set wrap!<CR>

" highlight most recent search matches toggle
nnoremap <Leader>h :set hls!<CR>

" use the current buffer's current directory for the file browser's current dir
set bsdir=current

" vertical spacing between lines
set lsp=5

" highlight current line
set cul

" Tab stuff
nnoremap <silent> <Leader>[ :tabprevious<CR>
nnoremap <silent> <Leader>] :tabnext<CR>

" JSON files are javascript
autocmd BufNewFile,BufRead *.json set ft=javascript

autocmd BufNewFile,BufRead *.podspec set ft=ruby
autocmd BufNewFile,BufRead Podfile set ft=ruby

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


"Show line number
set number

"Higlight current line only in insert mode
"autocmd InsertLeave * set nocursorline
"autocmd InsertEnter * set cursorline

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


" objective-c
autocmd FileType objc compiler clang
autocmd FileType objc set makeprg=clang
let g:clang_use_library=0
"let g:clang_library_path = "/usr/local/lib"
"let g:clang_path="/usr/local/bin"
"let g:clang_path="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin"
let g:clang_path="/usr/bin"
let g:clang_user_options="-fblocks -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS5.1.sdk -D__IPHONE_OS_VERSION_MIN_REQUIRED=50000 -DTARGET_OS_IPHONE=1"
" -D__IPHONE_OS_VERSION_MIN_REQUIRED=40300 -DTARGET_OS_IPHONE=1

" A list of options to add to the clang commandline, for example to add
" include paths, predefined macros, and language options.
let g:clang_opts = [
  \ "-x","objective-c" ]



" tabwidth/wrapping defaults (based on HTML filetype's setting)
set expandtab
set sw=2
set ts=2
set sts=2
set textwidth=0

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


" coffeescript auto-compile
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!
nmap <silent> <Leader>g :CoffeeMake! -b  <CR>


" Highlight 81 column
set colorcolumn=81
:highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

" ctrlp options
let g:ctrlp_working_path_mode = 2

autocmd FileType javascript set dictionary-=/Users/bryn/.vim/bundle/vim-node/dict/node.dict dictionary+=~/.vim/bundle/vim-node/dict/node.dict


set foldmethod=syntax





" from the LLVM .vimrc
" Delete trailing whitespace and tabs at the end of each line
command! DeleteTrailingWs :%s/\s\+$//

" Convert all tab characters to four spaces
command! Untab :%s/\t/    /g


"Map NERDTree file browser to \p
map <silent> <Leader>p :NERDTreeToggle<CR>
" autopen NERDTree and focus cursor in new document
"autocmd vimenter * NERDTree
"autocmd VimEnter * wincmd p
let NERDTreeShowHidden=1
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
" this will make nerdtree disappear when the last buffer is gone
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


"
" COMMANDS
"

function! XCodeBuild()
  let l:command = 'xcodebuild -sdk iphonesimulator5.1'
  let l:out = system(l:command)
  cexpr l:out
endfunction

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif









"function! LLVMClangComplete(findstart, base)
   "if a:findstart == 1
      "" In findstart mode, look for the beginning of the current identifier.
      "let l:line = getline('.')
      "let l:start = col('.') - 1
      "while l:start > 0 && l:line[l:start - 1] =~ '\i'
         "let l:start -= 1
      "endwhile
      "return l:start
   "endif

   "" Get the current line and column numbers.
   "let l:l = line('.')
   "let l:c = col('.')

   "" Build a clang commandline to do code completion on stdin.
   "let l:the_command = shellescape(g:clang_path) .
                     "\ " -cc1 -code-completion-at=-:" . l:l . ":" . l:c
   "for l:opt in g:clang_opts
      "let l:the_command .= " " . shellescape(l:opt)
   "endfor

   "" Copy the contents of the current buffer into a string for stdin.
   "" TODO: The extra space at the end is for working around clang's
   "" apparent inability to do code completion at the very end of the
   "" input.
   "" TODO: Is it better to feed clang the entire file instead of truncating
   "" it at the current line?
   "let l:process_input = join(getline(1, l:l), "\n") . " "

   "" Run it!
   "let l:input_lines = split(system(l:the_command, l:process_input), "\n")

   "" Parse the output.
   "for l:input_line in l:input_lines
      "" Vim's substring operator is annoyingly inconsistent with python's.
      "if l:input_line[:11] == 'COMPLETION: '
         "let l:value = l:input_line[12:]

        "" Chop off anything after " : ", if present, and move it to the menu.
        "let l:menu = ""
        "let l:spacecolonspace = stridx(l:value, " : ")
        "if l:spacecolonspace != -1
           "let l:menu = l:value[l:spacecolonspace+3:]
           "let l:value = l:value[:l:spacecolonspace-1]
        "endif

        "" Chop off " (Hidden)", if present, and move it to the menu.
        "let l:hidden = stridx(l:value, " (Hidden)")
        "if l:hidden != -1
           "let l:menu .= " (Hidden)"
           "let l:value = l:value[:l:hidden-1]
        "endif

        "" Handle "Pattern". TODO: Make clang less weird.
        "if l:value == "Pattern"
           "let l:value = l:menu
           "let l:pound = stridx(l:value, "#")
           "" Truncate the at the first [#, <#, or {#.
           "if l:pound != -1
              "let l:value = l:value[:l:pound-2]
           "endif
        "endif

         "" Filter out results which don't match the base string.
         "if a:base != ""
            "if l:value[:strlen(a:base)-1] != a:base
               "continue
            "end
         "endif

        "" TODO: Don't dump the raw input into info, though it's nice for now.
        "" TODO: The kind string?
        "let l:item = {
          "\ "word": l:value,
          "\ "menu": l:menu,
          "\ "info": l:input_line,
          "\ "dup": 1 }

        "" Report a result.
        "if complete_add(l:item) == 0
           "return []
        "endif
        "if complete_check()
           "return []
        "endif

      "elseif l:input_line[:9] == "OVERLOAD: "
         "" An overload candidate. Use a crazy hack to get vim to
         "" display the results. TODO: Make this better.
         "let l:value = l:input_line[10:]
         "let l:item = {
           "\ "word": " ",
           "\ "menu": l:value,
           "\ "info": l:input_line,
           "\ "dup": 1}

        "" Report a result.
        "if complete_add(l:item) == 0
           "return []
        "endif
        "if complete_check()
           "return []
        "endif

      "endif
   "endfor


   "return []
"endfunction LLVMClangComplete

"" This to enables the somewhat-experimental clang-based
"" autocompletion support.
"set omnifunc=LLVMClangComplete

