set nocompatible


set clipboard=unnamed
" set tabstop=2
set expandtab
set shiftwidth=2
set tabstop=2
set number
set smartindent

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'othree/html5.vim'
Plug 'leshill/vim-json'
Plug 'tpope/vim-markdown'
Plug 'mxw/vim-jsx'
Plug 'hail2u/vim-css3-syntax'
Plug 'jparise/vim-graphql'
Plug 'jelera/vim-javascript-syntax'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

let g:jsx_ext_required = 0

syntax on
