" Initializing pathogen for bundling other plugins
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible
syntax enable
filetype plugin indent on

set cursorline " Highlights the line where the cursor is on

set nu "display line numbers
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

set hidden " Hides buffers instead of forcing to save it before change it to other file

set incsearch "interative searching
set hlsearch "hilighting candidates

set background=dark 
colorscheme ir_black

"Add recently accessed projects menu (project pluginó)
set viminfo^=!

" Search tags file recursively
"set tags=tags;/

" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'

" Changes default directories for saving swap files and backup files 
set backupdir=~/.vim/backup/
set directory=~/.vim/tmp/ "for .swp files

" Show status bar always
set laststatus=2 
"set statusline=%<%F%=\ [%M%R%H%Y]\ (%(%l,%c%))
"set statusline=%F%m%r%h%w%=%{getcwd()}\ [%L][%{&ff}]%y[%p%%][%04l,%04v]
"set statusline=%F%m%r%h%w%=\ [%L][%{&ff}]%y[%p%%][%04l,%04v]
set showcmd
set showmode
set ruler

"Enhanced and sane auto completion setting
set wildmenu
set wildmode=list:longest,full

"My custom key maps
map <F2> :FufQuickfix <CR>
map <F3> :FufBuffer <CR>
" <C-]> Will delete selected buffer
map <F4> :FufFile <CR>
map <F5> :FufCoverageFile <CR>
map <F6> :FufBookmarkDir <CR>

nnoremap <F8> :TlistToggle <CR>

" Centering search result on the screen
nmap n nzz
nmap N Nzz

