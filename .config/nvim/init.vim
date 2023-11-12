syntax on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch showmatch
set wildmode=longest,list,full wildmenu
set ruler laststatus=2 showcmd showmode
set list listchars=trail:·,tab:·-
set shortmess=a
set nowrap
"set wrap breakindent fillchars+=vert:\
set encoding=utf-8 ff=unix fileformat=unix
set textwidth=0
set hidden
set relativenumber
set title
set mouse=a

autocmd BufNewFile,BufRead *.sh set formatprg=shfmt\ -i\ 2
