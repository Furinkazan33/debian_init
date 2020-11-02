
" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" For plugins to load correctly
filetype plugin indent on

""""""""""""""""""""""""""""""
" Folding
""""""""""""""""""""""""""""""
set foldenable
set foldmethod=marker
au FileType sh let g:sh_fold_enabled=5
au FileType sh let g:is_bash=1
au FileType sh let g:is_sh=1
au FileType sh let foldmethod="syntax"

""""""""""""""""""""""""""""""
" File browsing
""""""""""""""""""""""""""""""
" split vertically :Vexplore
"let g:netrw_banner=0       " disable banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_listsyle=3      " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\$\+'

""""""""""""""""""""""""""""""
" Mouse
""""""""""""""""""""""""""""""
" Do not select numbers with mouse
set mouse=a
" Enable click detection
map <xCSI>[62~ <MouseDown>

""""""""""""""""""""""""""""""
" Clipboard
""""""""""""""""""""""""""""""
set clipboard=unamed


""""""""""""""""""""""""""""""
" Completion
""""""""""""""""""""""""""""""
" :find with * and tab to make it fuzzy
set path+=**
set wildmenu

""""""""""""""""""""""""""""""
" ctags
""""""""""""""""""""""""""""""
" ctrl+[ on a word to jump to definition
command! MakeTags !ctags -R .

""""""""""""""""""""""""""""""
" Leader key, default is "\"
""""""""""""""""""""""""""""""
" let mapleader=
noremap <Space> <Nop>
map <Space> <Leader>

""""""""""""""""""""""""""""""
" Turn off modelines like :ts=4:sw=4
""""""""""""""""""""""""""""""
set modelines=0

""""""""""""""""""""""""""""""
" Display options
""""""""""""""""""""""""""""""
set noshowmode "Don't show mode on last line
set showcmd " Show typed commands on last line
set ttyfast 
set number relativenumber
set ruler
set visualbell
set encoding=utf-8
"syntax on
syntax enable
set wrap
set linebreak
set showbreak="+++ "
set textwidth=0
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
:au FileType html,xml set mps+=<*>:</*>

" Allow hidden buffers
set hidden

" Status bar
set laststatus=2

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Airline theme
let g:airline_theme='bubblegum'

"colorscheme gruvbox8_soft
"colorscheme gruvbox8
colorscheme gruvbox8_hard

"set bg=light
set bg=dark

""""""""""""""""""""""""""""""
" Searching
""""""""""""""""""""""""""""""
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

""""""""""""""""""""""""""""""
" Formatting 
""""""""""""""""""""""""""""""
" Paragraph
"map <??> <ESC>gqip
" Trim multiple blanks lines
map <F2> <ESC>:%s/\s\+\n/\r/g<CR>
" Hooks to newline, so we can use [[ and ]] to navigate
map <F3> <ESC>:%s/()\s\+{/()\r{/g<CR>
" Reindent the whole file
map <F4> <ESC>gg=G

" Visualize tabs and newlines, enable by default, \ + l to toggle
set listchars=tab:▸\ ,eol:¬
set list
map <leader>l :set list!<CR>



""""""""""""""""""""""""""""""
" Syntastic options
""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1
let g:syntastic_sh_checkers=['shellcheck', 'sh', 'bashate', 'checkbashisms']
let g:syntastic_shell="/bin/bash"

""""""""""""""""""""""""""""""
" rc files
""""""""""""""""""""""""""""""
nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

source ~/.vim/.vimrc-commands

