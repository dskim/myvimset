" Initializing pathogen for bundling other plugins

let mapleader = ","

syntax on
set nocompatible
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.Vim'

" original repos on github
Plugin 'vim-ruby/vim-ruby.git'
Plugin 'tpope/vim-vinegar.git'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround.git'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'edsono/vim-matchit.git'
Plugin 'godlygeek/tabular.git'
Plugin 'itchyny/lightline.vim'
Plugin 'kien/ctrlp.vim.git'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'widox/vim-buffer-explorer-plugin'
Plugin 'kchmck/vim-coffee-script'
Plugin 'slim-template/vim-slim.git'
Plugin 'vim-scripts/YankRing.vim.git'
"Plugin 'thoughtbot/vim-rspec'
Plugin 'jgdavey/vim-turbux'
Plugin 'benmills/vimux'
Plugin 'edkolev/tmuxline.vim'
Plugin 'rizzatti/dash.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:50'
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = ''
let g:ctrlp_max_files=0
let g:ctrlp_max_depth = 40

" Improve ctrlp index and match performance
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

let g:ag_highlight=1

let g:yankring_replace_n_pkey = '<C-k>'
let g:yankring_replace_n_nkey = '<C-j>'

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightLineFilename',
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly'
      \ }
      \ }

function! LightLineFilename()
  return expand('%')
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

let g:tmuxline_preset = 'full'

set iskeyword+=-
set clipboard=unnamed

set cursorline cursorcolumn " Highlights the line where the cursor is on

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
"set ch=2

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
set foldmethod=indent

" I don't want automatic folds so set it to high
set foldlevel=99
set foldcolumn=1

" Auto save files when focus is lost

"Enhanced and sane auto completion setting
set wildmenu
set wildmode=list:longest,full

" This line will make Vim set out tab characters, trailing whitespace and invisible spaces visually,
" and additionally use the # sign at the end of lines to mark lines that extend off-screen. For more info, see :h listchars.
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set backspace=indent,eol,start

"let g:rspec_command = "!zeus rspec {spec}"

let g:turbux_runner  = 'vim'      " default: vimux OR tslime OR vim
"let g:turbux_command_prefix = 'zeus'
let g:turbux_command_rspec = 'rspec -f d'
let g:turbux_command_cucumber = 'cucumber'

" RSpec.vim mappings
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

nnoremap <Leader>sr :YRShow <CR>

nnoremap <silent> sm :Rmodel <CR>
nnoremap <silent> sv :Rview <CR>
nnoremap <silent> sc :Rcontroller <CR>
nnoremap <silent> sf :Rfind <CR>
nnoremap <silent> sg :Rmigration <CR>

" Map jj and kk to escape from insert mode
" Otherwise just use Ctrl-c
imap jj <Esc>
imap kk <Esc>

" Map Tabularize
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>tb :Tabularize /\|<CR>
vmap <Leader>tb :Tabularize /\|<CR>
nmap <Leader>th :Tabularize /^[^=>]*\zs=>/l1<CR>
nmap <Leader>th :Tabularize /^[^=>]*\zs=>/l1<CR>

" Jump to a tag on new tab
nmap <C-Enter> <C-w><C-]><C-w>T

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

set spell " Turn Spellcheck  on

set mouse=a
