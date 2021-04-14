syntax on

" All the defaults
set exrc
set guicursor=
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set colorcolumn=88
set cmdheight=2
set laststatus=2

" Rules for Python files
au BufNewFile,BufRead *.py
    \ set textwidth=88 |
    \ set fileformat=unix |
    \ set encoding=utf-8

" Rules for Markdown files
au BufNewFile,BufRead *.md
    \ set spell spelllang=en_us |
    \ set wrap |
    \ set linebreak |
    \ set nolist |
    \ set textwidth=79 |
    \ set tabstop=2 |
    \ set shiftwidth=2 |
    \ set softtabstop=2

" Vim Plug loader
call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'haishanh/night-owl.vim'
Plug 'preservim/nerdtree'
Plug 'ycm-core/YouCompleteMe'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

" Color scheme that doesn't kill the eyes
colorscheme night-owl
set background=dark
highlight Normal guibg=NONE

" Lightline, do I like this?
let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }

" Handy function to trim whitespaces
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup EGGS
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
    "autocmd VimEnter * NERDTree | wincmd p
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    autocmd BufWritePre *.py execute ':Black'
augroup END

" Key remaps
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

" No arrows for insert mode
inoremap   <Up>     <NOP>
inoremap   <Down>   <NOP>
inoremap   <Left>   <NOP>
inoremap   <Right>  <NOP>

