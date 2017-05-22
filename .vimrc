scriptencoding utf-8
set encoding=utf-8

""""""""""""""""""""""
"      Plugins       "
""""""""""""""""""""""
" https://github.com/junegunn/vim-plug
call plug#begin()
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/molokai'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'fatih/vim-go', { 'tag': '*', 'for': 'go' }
call plug#end()

""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""
set nocompatible                " Enables Vim specific features
set ttyfast                     " Indicate fast terminal conn for faster redraw
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection
set autoindent                  " Enabile Autoindent
set laststatus=2                " Always show status line
set autoread                    " Automatically read changed files
set backspace=indent,eol,start  " Makes backspace key more powerful.
set hlsearch                    " Highlight found searches
set incsearch                   " Shows the match while typing
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set noerrorbells                " No beeps
set number                      " Show line numbers
set ruler                       " Show the line number and column in the status bar
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
set hidden                      " Buffer should still exist if window is closed
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " Show the mode with airline or lightline
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set pumheight=10                " Completion window max size
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
set nocursorline                " Do not highlight cursor (speeds up highlighting)
set lazyredraw                  " Wait to redraw
set splitbelow                  " Splits show up below by default
set splitright                  " Splits go to the right by default
set title                       " Set the title for gvim
set visualbell                  " Use a visual bell to notify us
set showmatch                   " Highlight matching braces
set showmode                    " Show the current mode on the open buffer
set colorcolumn=80              " Highlight 80 character limit
set list                        " Show invisible characters
set listchars=tab:›\ ,eol:¬,trail:⋅ "Set the characters for the invisibles
set mouse=a                     " Mouse support in the terminal
if !has('nvim')
  set ttymouse=xterm2
endif

" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

" Color scheme
syntax enable
set t_Co=256
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

" GUI settings
if has("gui_running")
  set macligatures
  set guifont=FiraCode-Bold:h22
  if exists("&fuopt")
    set fuopt+=maxhorz
  endif
endif

""""""""""""""""""""""
"      Mappings      "
""""""""""""""""""""""
"let mapleader=";"

" Get rid of search highlights
noremap <silent><leader>/ :nohlsearch<cr>


"""""""""""""""""""""
" Plugins Settings  "
"""""""""""""""""""""
" vim-go
let g:go_disable_autoinstall = 1
let g:go_autodetect_gopath = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='molokai'

" UltiSnips triggering
let g:UltiSnipsExpandTrigger = '<C-s>'
let g:UltiSnipsJumpForwardTrigger = '<C-s>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

"""""""""""""""""""""
"      Extras       "
"""""""""""""""""""""
" tab customization for specific files
autocmd FileType html,json,ruby,yaml setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" remove trailing whitespace on save for specific file types
"autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType go,html,json,yaml,ruby autocmd BufWritePre <buffer> %s/\s\+$//e
