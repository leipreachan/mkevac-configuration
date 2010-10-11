set t_Co=256
set nocompatible
syntax enable
set expandtab
set smarttab
set showmatch
set visualbell t_vb= " turn off error beep/flash
set ruler " Show the cursor position all the time
set hlsearch
set incsearch
set ignorecase

set termencoding=utf8
set fileencodings=utf8,cp1251
set encoding=utf8

" Enable filetype plugin
filetype plugin on
filetype indent on

"Turn on WiLd menu
set wildmenu

" Show line number
set number
set numberwidth=4

set magic " Set magic on

"Always show the statusline
set laststatus=2

set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.DS_Store,*.db
set statusline=%F%m%r%h%w\ [%Y\ %{&ff}\ %{&encoding}]\ [%l/%L\ (%p%%)\ %c]

set nobackup
set nowritebackup
set noswapfile

" Wrap lines
set wrap

" Remove indenting on empty lines
map <F2> :%s/\s*$//g<cr>:noh<cr>''

" Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F3>

map <F4> :TlistToggle<cr>
map <F5> :NERDTreeToggle<cr>

set cursorline
set cursorcolumn
hi cursorline guibg=#333333 
hi cursorcolumn guibg=#333333

" Omni menu colors
hi Pmenu guibg=#333333
hi PmenuSel guibg=#555555 guifg=#ffffff

set backspace=indent,eol,start

set foldcolumn=5
set foldmethod=syntax

if has("autocmd")
    au FileType helpfile set nonumber      " no line numbers when viewing help
    au FileType helpfile nnoremap <buffer><cr> <c-]>   " Enter selects subject
    au FileType helpfile nnoremap <buffer><bs> <c-T>   " Backspace to go back
    
    au FileType cpp,c set shiftwidth=4 tabstop=4 autoindent smartindent cindent cino=:0(0 textwidth=79
    au FileType python set shiftwidth=4 tabstop=4 textwidth=79 foldmethod=indent

    au BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
    au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    
    au BufNewFile,BufRead  modprobe.conf set syntax=modconf

    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    autocmd FileType c set omnifunc=ccomplete#Complete

    " highlight lines with width more than textwidth
    autocmd BufNewFile,BufRead *.c exec 'match Todo /\%>' . &textwidth . 'v.\+/'

    " highlight trailing spaces
    au BufNewFile,BufRead * let b:mtrailingws=matchadd('ErrorMsg', '\s\+$', -1)

    " highlight tabs between spaces
    au BufNewFile,BufRead * let b:mtabbeforesp=matchadd('ErrorMsg', '\v(\t+)\ze( +)', -1)
    au BufNewFile,BufRead * let b:mtabaftersp=matchadd('ErrorMsg', '\v( +)\zs(\t+)', -1)

    " Vala support
    au BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
    au BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
    au BufRead,BufNewFile *.vala            setfiletype vala
    au BufRead,BufNewFile *.vapi            setfiletype vala
endif

if has("gui_running")
    " See ~/.gvimrc
    set guifont=Monaco\ 9 " use this font
    set lines=50          " height = 50 lines
    set columns=120       " width = 100 columns
    set background=dark   " adapt colors for background
    set guioptions-=T
    colorscheme wombat 
else
    colorscheme wombat
    set background=dark   " adapt colors for background
endif

set grepprg=grep\ -nH\ $*

" NERD_tree config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\.bak$', '\~$']
let NERDTreeShowBookmarks=1

" TagList Plugin Configuration
"let Tlist_Ctags_Cmd='/opt/local/bin/ctags' " point taglist to ctags
let Tlist_GainFocus_On_ToggleOpen = 1      " Focus on the taglist when its toggled
"let Tlist_Close_On_Select = 1              " Close when something's selected
"let Tlist_Use_Right_Window = 1             " Project uses the left window
let Tlist_File_Fold_Auto_Close = 1         " Close folds for inactive files

" BufExplorer
nmap <C-F5> <Esc>:BufExplorer<cr>
vmap <C-F5> <esc>:BufExplorer<cr>
imap <C-F5> <esc>:BufExplorer<cr>

" F6 - предыдущий буфер
nmap <C-F6> :bp<cr>
vmap <C-F6> <esc>:bp<cr>i
imap <C-F6> <esc>:bp<cr>i

" F7 - следующий буфер
nmap <C-F7> :bn<cr>
vmap <C-F7> <esc>:bn<cr>i
imap <C-F7> <esc>:bn<cr>i

imap <c-space> <c-x><c-o>

menu Encoding.&koi8-r :e ++enc=koi8-r<CR>
menu Encoding.&windows-1251 :e ++enc=cp1251<CR>
menu Encoding.&cp866 :e ++enc=cp866<CR>
menu Encoding.&utf-8 :e ++enc=utf8 <CR>
