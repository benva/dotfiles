" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Load plugins here
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-endwise'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
call plug#end()

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Use new regular expression engine
set re=0

" Disable continuing comments on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Pick a leader key
let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Change update time
set updatetime=100

" Path resolution
set path=.,src,app
set suffixesadd=.js,.jsx,.ts,.tsx

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
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
runtime! macros/matchit.vim

" Keep cursor centered
nnoremap G Gzz
augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/2
augroup END

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

 " Clear search
map <leader><space> :let @/=''<cr>

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Disable swap file creation
set noswapfile

" Use system clipboard
set clipboard=unnamed

" Split windows below instead of on top
set splitbelow

" Set split windows to open on the right
set splitright

" Highlight current cursor line
set cursorline

" Relative line numbers
set number relativenumber
set nu rnu

" Open new tab
nnoremap <leader>t :tabnew<CR>

" Open new vertical split
nnoremap <leader>v :vnew<CR>

" Copy file relative path
nnoremap <leader>cf :let @*=expand("%")<CR>

" Edit .vimrc file
nnoremap <leader>ev :e ~/.vimrc<CR>

" Source .vimrc file
nnoremap <leader>sv :source ~/.vimrc<CR>

" Color scheme (terminal)
set t_Co=256
set background=dark
autocmd vimenter * ++nested colorscheme gruvbox

" NERDTree
nnoremap <C-t> :NERDTreeFind<CR>
let g:NERDTreeWinPos = "right"

" vim-airline
let g:airline_theme = 'minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_section_z = airline#section#create_right(['%c', '%l/%L', '%p%%'])
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5

" FZF
nnoremap <C-p> :GFiles --exclude-standard --others --cached<cr>
nnoremap <C-f> :Rg<cr>
nnoremap <C-h> :History<CR>

" Stop using arrow keys
nnoremap <Left> :echo "No Left for you!"<CR>
vnoremap <Left> :<C-u>echo "No Left for you!"<CR>
inoremap <Left> <C-o>:echo "No Left for you!"<CR>
nnoremap <Right> :echo "No Right for you!"<CR>
vnoremap <Right> :<C-u>echo "No Right for you!"<CR>
inoremap <Right> <C-o>:echo "No Right for you!"<CR>
nnoremap <Down> :echo "No Down for you!"<CR>
vnoremap <Down> :<C-u>echo "No Down for you!"<CR>
inoremap <Down> <C-o>:echo "No Down for you!"<CR>
nnoremap <Up> :echo "No Up for you!"<CR>
vnoremap <Up> :<C-u>echo "No Up for you!"<CR>
inoremap <Up> <C-o>:echo "No Up for you!"<CR>

" vim-fugitive
nnoremap <leader>g :vert G<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Git blame<CR>
let g:fugitive_pty = 0

" coc.nvim
let g:coc_global_extensions = [
\ 'coc-css',
\ 'coc-json',
\ 'coc-eslint',
\ 'coc-html',
\ 'coc-solargraph',
\ 'coc-yaml',
\ 'coc-tsserver',
\ 'coc-prettier',
\ ]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Ruby
" TODO: Uncomment for work computer
" nnoremap <leader>rt :vert term docker exec -ti rails-api rails test %<CR>
nnoremap <leader>rt :vert term rails test %<CR>
nnoremap <leader>rc :call CocActionAsync('format')<CR>

" vim-closetag
let g:closetag_filenames = '*.js,*.jsx,*.ts,*.tsx'

" indentLine
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_char = '·'
