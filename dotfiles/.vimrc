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
Plug 'haishanh/night-owl.vim'
Plug 'macguirerintoul/night_owl_light.vim'
Plug 'preservim/nerdtree'
call plug#end()

" Color scheme that doesn't kill the eyes
colorscheme night_owl_light
" set background=dark
" Disabled due to Windows Terminal being funky with backgrounds
highlight Normal guibg=NONE

" Handy function to trim whitespaces
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup EGGS
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
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

