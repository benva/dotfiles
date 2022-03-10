" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" vim-polyglot
let g:polyglot_disabled = ['markdown']

" Load plugins here
call plug#begin()
" Visual aesthetic
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
" File browsing
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Quality of life
Plug 'tpope/vim-commentary'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'Yggdroot/indentLine'
" Testing
Plug 'vim-test/vim-test'
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Syntax highlighting
Plug 'sheerun/vim-polyglot'
call plug#end()

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Auto indent on new line
set autoindent

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
set path=.,src
set path+=**
set suffixesadd=.js,.jsx,.ts,.tsx,.py

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

" Remap Y to y$
nnoremap Y y$

" Open new tab
nnoremap <leader>t :tabnew<CR>

" Copy file relative path
nnoremap <leader>cf :let @*=expand("%")<CR>

" Edit .vimrc file
nnoremap <leader>ev :e ~/.config/nvim/init.vim<CR>

" Source .vimrc file
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>

" Save file
nnoremap <C-s> :w<CR>

" Color scheme (terminal)
set t_Co=256
set background=dark
autocmd vimenter * ++nested colorscheme gruvbox

" Stop using arrow keys
nnoremap <Left> :echo "No Left for you!"<CR>
vnoremap <Left> :<C-u>echo "No Left for you!"<CR>
inoremap <Left> <C-o>:echo "No Left for you!"<CR>
nnoremap <Right> :echo "No Right for you!"<CR>
vnoremap <Right> :<C-u>echo "No Right for you!"<CR>
inoremap <Right> <C-o>:echo "No Right for you!"<CR>
" nnoremap <Down> :echo "No Down for you!"<CR>
vnoremap <Down> :<C-u>echo "No Down for you!"<CR>
inoremap <Down> <C-o>:echo "No Down for you!"<CR>
" nnoremap <Up> :echo "No Up for you!"<CR>
vnoremap <Up> :<C-u>echo "No Up for you!"<CR>
inoremap <Up> <C-o>:echo "No Up for you!"<CR>

" NERDTree
nnoremap <silent> <expr> <C-t> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize=45

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
let g:fzf_layout = { 'window': { 'width': 0.5, 'height': 0.5 } }

" vim-fugitive
nnoremap <leader>gg :vert G<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Git blame<CR>

" coc.nvim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

let g:coc_global_extensions = [
\ 'coc-eslint',
\ 'coc-tsserver',
\ 'coc-pyright'
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

" indentLine
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_char = '·'

" vim-test
nnoremap <leader>rf :TestFile<CR>
nnoremap <leader>rs :TestSuite<CR>
nnoremap <leader>rr :TestLast<CR>
nnoremap <leader>rt :TestNearest<CR>
let test#strategy = "vimterminal"
let test#vim#term_position = "vert"
let test#javascript#jest#executable = "TZ=UTC NODE_ENV=test yarn run jest --config=jest.config.js --no-cache"

