"Vundle related
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
"Plugin 'bling/vim-bufferline'
call vundle#end()
filetype plugin indent on
"End Vundle related

" 
" Plugin settings
"
let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_trigger = 0


"
" General vim settings
"

set nocompatible
syntax on
set history=500
set nowrap
set tabstop=2
set expandtab
set shiftwidth=2
set showmatch
set showmode
set autoindent
set smartindent
set number

" Set the search scan to wrap around the file
set wrapscan

" set visual bell
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Get rid of annoying preview pane when completions are offered
set completeopt-=preview

if !&diff
  colorscheme jellybeans
endif

" set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

"Add dollar sign to end of replacement region
set cpoptions+=$

set virtualedit=all

" Set the status line the way i like it
"" set stl=%f\ %m\ %r\ Line:%l/%L\ Col:%c\ Buf:%n\ Offset:%o\ [%b][0x%B]

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Disable encryption (:X)
set key=

" Make the command-line completion better
set wildmenu

" Incrementally match the search
set incsearch

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048


"
" Shortcuts for buffers, navigation etc
"

" edit vim config file
nmap <silent> ,ev :e ~/.vimrc<cr>

" source vim config file
nmap <silent> ,sv :so ~/.vimrc<cr>

" Switch, close and list buffers
nmap <silent> > : bn<cr>
nmap <silent> < : bp<cr>
nmap <silent> Q : bd<cr>
nmap <silent> ? : ls<cr>

" Toggle highlight search
nmap <silent> ,h :set invhls<cr>:set hls?<cr>

" Toggle line numbers
map <silent> ,ln :set number!<cr>

" Toggle visible whitespace
map <silent> ,ss :set list!<cr>

" Wrap paragraph
nmap <silent> ,ww gq}


"
" Clang-format runs with ctrl-k
"
map <C-K> :pyf /Users/jon/DEV/clang-format.py<CR>
imap <C-K> <ESC>:pyf /Users/jon/DEV/clang-format.py<CR>i

"
" YouCompleteMe: Get-type and Go-to-definition 
" (ctrl-o returns to previous jump-point in vim)
"
map <C-Y> :YcmCompleter GetType<cr>
imap <C-Y> <ESC>:YcmCompleter GetType<cr>
map <C-G> :YcmCompleter GoTo<cr>
imap <C-G> <ESC>:YcmCompleter GoTo<cr>

