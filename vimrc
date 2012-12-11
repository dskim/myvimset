" Initializing pathogen for bundling other plugins

let mapleader = ","
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" original repos on github
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround.git'
Bundle 'mileszs/ack.vim.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'edsono/vim-matchit.git'
Bundle 'msanders/snipmate.vim.git'
Bundle 'godlygeek/tabular.git'
Bundle 'Lokaltog/vim-powerline.git'
Bundle 'kien/ctrlp.vim.git'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'widox/vim-buffer-explorer-plugin'
Bundle 'ervandew/supertab.git'
Bundle 'kchmck/vim-coffee-script'

filetype plugin indent on     " required!

set nocompatible

let g:ctrlp_working_path_mode = 0

syntax on

filetype on
filetype indent on
filetype plugin on

set cursorline " Highlights the line where the cursor is on

set number "display line numbers

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent

"set cpoptions+=$ " Displays $ when changing blocks

set hidden " Hides buffers instead of forcing to save it before change it to other file

" Don't update the display while executing macros
set lazyredraw

set incsearch "interative searching
set hlsearch "hilighting candidates

set visualbell

set background=dark

colorscheme solarized

"Add recently accessed projects menu (project pluginó)
set viminfo^=!

" Same as default except that I remove the 'u' option
set complete=.,w,b,t

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" Search tags file recursively
"set tags=tags;/

" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'

" Changes default directories for saving swap files and backup files 
set backupdir=~/.vim/backup/
set directory=~/.vim/tmp/ "for .swp files

" Show status bar always
set laststatus=2

" Make command line two lines high
set ch=2

" Set the status line the way I like it
"set statusline=%f\ [%M%R%H%Y]\ %r\ %{fugitive#statusline()}\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

"set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" Allow the cursor to go in to "invalid" places
"set virtualedit=all

" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
"set scrolloff=8

" Keep some stuff in the history
set history=100

set showcmd
set showmode
set ruler

" Enalble fold function
set foldenable

" It seems to be better as it supports folding for pretty much any text that
" has reasonable indent
set foldmethod=syntax

" I don't want automatic folds so set it to high
set foldlevel=99
set foldcolumn=2

" Auto save files when focus is lost

"Enhanced and sane auto completion setting
set wildmenu
set wildmode=list:longest,full

" This line will make Vim set out tab characters, trailing whitespace and invisible spaces visually,
" and additionally use the # sign at the end of lines to mark lines that extend off-screen. For more info, see :h listchars.
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

nnoremap <Leader>nt :NERDTree <CR>
nnoremap <Leader>nf :NERDTreeFind <CR>

nnoremap <silent> sm :Rmodel <CR>
nnoremap <silent> sv :Rview <CR>
nnoremap <silent> sc :Rcontroller <CR>
nnoremap <silent> sf :Rfind <CR>
nnoremap <silent> sg :Rmigration <CR>

" Centering search result on the screen
nnoremap n nzz
nnoremap N Nzz

" Map jj and kk to escape from insert mode
" Otherwise just use Ctrl-c
imap jj <Esc>
imap kk <Esc>

" Map Tabularize
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>tb :Tabularize /\|<CR>
vmap <Leader>tb :Tabularize /\|<CR>
nmap <Leader>th :Tabularize /\w:\zs/l0l1<CR>
vmap <Leader>th :Tabularize /\w:\zs/l0l1<CR>

" Jump to a tag on new tab
nmap <C-Enter> <C-w><C-]><C-w>T

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

"set spell " Turn Spellcheck  on

" GUI OPTIONS
if has("gui_running")
  "set noantialias
  "set guifont=Inconsolata:h12
  set guifont=Monaco:h14
  set fuoptions=maxvert,maxhorz "Allow MacVim take FULL screen
  set transparency=5
  set guioptions=egmt
  set macmeta "Use option key as Meta key
  set lines=40 columns=140
endif

