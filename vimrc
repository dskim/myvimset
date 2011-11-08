" Initializing pathogen for bundling other plugins
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible

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

colorscheme xoria256_mod

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
set statusline=%f\ [%M%R%H%Y]\ %r\ %{fugitive#statusline()}\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" Allow the cursor to go in to "invalid" places
"set virtualedit=all

" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8

" Keep some stuff in the history
set history=100

set showcmd
set showmode
set ruler

" Enalble fold function
set foldenable

" It seems to be better as it supports folding for pretty much any text that
" has reasonable indent
set foldmethod=manual

" I don't want automatic folds so set it to high
set foldlevel=99
set foldcolumn=2

"Enhanced and sane auto completion setting
set wildmenu
set wildmode=list:longest,full

"My custom key maps
nnoremap <F2> :FufQuickfix <CR>
nnoremap <F3> :FufBuffer <CR>

" <C-]> Will delete selected buffer
nnoremap <F4> :FufFile <CR>
nnoremap <F5> :FufCoverageFile <CR>
nnoremap <F6> :FufBookmarkDir <CR>
nnoremap <F7> :NERDTreeToggle <CR>
nnoremap <F8> :TlistToggle <CR>

nnoremap <silent> sl :FufCoverageFile <CR>

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
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>at :Tabularize /\|<CR>
vmap <Leader>at :Tabularize /\|<CR>

" Jump to a tag on new tab
nmap <C-Enter> <C-w><C-]><C-w>T

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

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

"set spell " Turn Spellcheck on
