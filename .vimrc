"Vundle related
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tell-k/vim-autopep8'
"Plugin 'bling/vim-bufferline'
call vundle#end()
filetype plugin indent on
"End Vundle related

"
" General vim settings
"
set cursorline 
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
set foldmethod=syntax
set nofoldenable

let mapleader = ","

" Set the search scan to wrap around the file
set wrapscan

" set visual bell
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Get rid of annoying preview pane when completions are offered
" set completeopt-=preview
set completeopt=menu,menuone
" set completeopt=preview

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

"Allow cursor navigation to non-existent positions
set virtualedit=all

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

" Switch, close and list buffers
nmap <silent> > : bn<cr>
nmap <silent> < : bp<cr>
nmap <silent> Q : bd<cr>
nmap <silent> ? : ls<cr>

" edit vim config file
nmap <silent> <Leader>ev :e ~/.vimrc<cr>

" source vim config file
nmap <silent> <Leader>sv :so ~/.vimrc<cr>

" Toggle highlight search
nmap <silent> <Leader>h :set invhls<cr>:set hls?<cr>

" Toggle line numbers
map <silent> <Leader>ln :set number!<cr>

" Toggle visible whitespace
map <silent> <Leader>ss :set list!<cr>

" Fix trailing whitespace
map <silent> <Leader>sf :%s/\s*$//<cr>

" Wrap paragraph
nmap <silent> <Leader>ww gq}

"
" Clang-format runs with ctrl-k
"
autocmd Filetype cpp map <C-K> :pyf /usr/local/Cellar/llvm/3.9.0/share/clang/clang-format.py<cr>
autocmd Filetype cpp imap <C-K> <c-o>:pyf /usr/local/Cellar/llvm/3.9.0/share/clang/clang-format.py<cr>

autocmd Filetype python map <C-K> :call Autopep8()<cr>
autocmd Filetype python imap <C-K> <c-o>:call Autopep8()<cr>

let g:clang_include_fixer_path="/Users/jon/DEV/LLVM/release-ninja/bin/clang-include-fixer"
noremap <Leader>ci :pyf /Users/jon/DEV/LLVM/src/tools/clang/tools/extra/include-fixer/tool/clang-include-fixer.py<cr>

" This is unusably slow right now
let g:clang_rename_path="/Users/jon/DEV/LLVM/release-ninja/bin/clang-rename"
noremap <Leader>cr :pyf /Users/jon/DEV/LLVM/src/tools/clang/tools/extra/clang-rename/tool/clang-rename.py<cr>

"
" YouCompleteMe: Get-type and Go-to-definition
" (ctrl-o returns to previous jump-point in vim)
"
map <silent> <C-Y> :YcmCompleter GetType<cr>
map <silent> <C-G> :YcmCompleter GoTo<cr>
map <silent> <C-F> :YcmCompleter FixIt<cr>
map <silent> <C-J> :YcmForceCompileAndDiagnostics<cr>
map <silent> <C-H> :YcmCompleter GoToInclude<cr>

"let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_trigger = 1
let g:ycm_path_to_python_interpreter="/usr/local/bin/python"
let g:ycm_seed_identifiers_with_syntax = 1 "auto-complete on language syntax
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_extra_conf_globlist = ['~/DEV/*','!*']

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_add_preview_to_completeopt = 1

let g:autopep8_disable_show_diff=1
