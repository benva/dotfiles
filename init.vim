" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" vim-polyglot
let g:polyglot_disabled = ['markdown']

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load plugins here
call plug#begin()
" Visual aesthetic
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
" Git
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
set formatoptions=cqrn1
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
augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/2
augroup END

" Move up/down editor lines
nnoremap j gj
nnoremap k gk
nnoremap G Gzz

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

 " Clear search
map <leader><space> :let @/=''<cr>

" Remap Y to y$
nnoremap Y y$

" Open new tab
nnoremap <leader>t :tabnew<CR>

" Copy file relative path
nnoremap <leader>cf :let @*=expand("%")<CR>

" Edit init.vim file
nnoremap <leader>ev :e ~/.config/nvim/init.vim<CR>

" Source init.vim file
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>

" Save file
nnoremap <leader>s :noa w<CR>
nnoremap <C-s> :w<CR>

" Color scheme (terminal)
set t_Co=256
set background=dark
autocmd vimenter * ++nested colorscheme gruvbox

" NERDTree
nnoremap <silent> <expr> <C-t> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize=45

" FZF
nnoremap <C-p> :GFiles --exclude-standard --others --cached<cr>
nnoremap <C-f> :Rg<cr>
nnoremap <C-h> :History<CR>
let g:fzf_preview_window = ['hidden', 'ctrl-/']
let g:fzf_layout = { 'window': { 'width': 0.5, 'height': 0.5 } }

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
\ 'coc-pyright'
\ ]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Scroll floating windows
nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"
inoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
vnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"

" indentLine
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_char = '·'

