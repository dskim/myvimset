" Initializing pathogen for bundling other plugins

let mapleader = ","

set nocompatible

call plug#begin('~/.vim/plugged')
" original repos on github
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
"Plug 'rking/ag.vim'
"Plug 'jremmen/vim-ripgrep'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/matchit.zip'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'widox/vim-buffer-explorer-plugin'
"Plug 'kchmck/vim-coffee-script'
Plug 'slim-template/vim-slim'
Plug 'jgdavey/vim-turbux'
Plug 'benmills/vimux'
Plug 'edkolev/tmuxline.vim'
Plug 'rizzatti/dash.vim'
Plug 'pangloss/vim-javascript'
"Plug 'mxw/vim-jsx'
"Plug 'elixir-editors/vim-elixir'
"Plug 'slashmili/alchemist.vim'
"Plug 'c-brenn/phoenix.vim'
Plug 'tpope/vim-projectionist' " required for some navigation features
"Plug 'elmcast/elm-vim'
Plug '/usr/local/opt/fzf'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'wellle/context.vim'

if has('nvim')
  Plug 'neovim/nvim-lspconfig'
endif

" All of your Plugins must be added before the following line
call plug#end()

"let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
"let g:ctrlp_show_hidden = 1
"let g:ctrlp_working_path_mode = 0
"let g:ctrlp_use_caching = 0
"let g:ctrlp_max_files=0
"let g:ctrlp_max_depth = 10
"let g:ctrlp_switch_buffer = 'Et'
"let g:ctrlp_lazy_update = 1
"let g:ctrlp_match_current_file = 1

"" Improve ctrlp index and match performance
""let g:ctrlp_user_command = 'rg %s --files --color=never --hidden --glob ""'
"let g:ctrlp_custom_ignore = {
      "\ 'dir':  '\v[\/]\.(git|hg|svn)$',
      "\ 'file': '\v\.(exe|so|dll)$',
      "\ }

"let g:ag_prg = 'ag --nogroup --hidden --vimgrep'
"let g:ag_highlight=1

"let g:rg_command='rg --hidden --vimgrep'
"let g:rg_highlight=1

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

nnoremap <C-p> :Files <CR>

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

"let g:jsx_ext_required = 0

"let g:mix_format_on_save = 1
"let g:mix_format_options = '--check-equivalent'

set iskeyword+=-
set clipboard=unnamed

"set cursorline cursorcolumn " Highlights the line where the cursor is on

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
"let g:turbux_command_rspec = 'docker-compose exec web bundle exec rspec -f d'
let g:turbux_command_rspec = 'bundle exec rspec -f d'
"let g:turbux_command_cucumber = 'cucumber'

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

" XML file formatting
nmap <Leader>xl :%! xmllint --format -<CR>

" Map Tabularize
nmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>tb :Tabularize /\|<CR>
nmap <Leader>th :Tabularize /^[^=>]*\zs=>/l1<CR>

" Jump to a tag on new tab
nmap <C-Enter> <C-w><C-]><C-w>T

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

set spell " Turn Spellcheck  on

set mouse=a

"NeoVim handles ESC keys as alt+key, set this to solve the problem
if has('nvim')
  set ttimeout
  set ttimeoutlen=0
endif

