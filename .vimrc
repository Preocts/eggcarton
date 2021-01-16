syntax on

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
    set termguicolors
endif

set number
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set t_Co=256
set colorcolumn=80

au BufNewFile,BufRead *.py
    \ set textwidth=79 |
    \ set nowrap |
    \ set fileformat=unix |
    \ set encoding=utf-8

au BufNewFile,BufRead *.md
    \ set spell spelllang=en_us |
    \ set wrap |
    \ set linebreak |
    \ set nolist |
    \ set textwidth=79 |
    \ set tabstop=2 |
    \ set shiftwidth=2 |
    \ set softtabstop=2 

colorscheme night-owl