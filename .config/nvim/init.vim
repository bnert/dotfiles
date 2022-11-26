set nocompatible

filetype on
filetype indent on
filetype plugin on
filetype indent plugin on

" Search
set showmatch
set hlsearch
set incsearch

" Spacing
set expandtab
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Editing
set number
set wildmode=longest,list
set cc=80
set syntax=on
set cursorline
set ttyfast
set relativenumber

" plugins
lua require('plugins')

" File type
augroup fastlane
  au BufNewFile,BufRead Fastfile set syntax=ruby
  au BufNewFile,BufRead Appfile set syntax=ruby
augroup END

augroup golang
  au BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=0
augroup END

augroup elixir
  au BufNewFile,Bufread *.exs set syntax=elixir
augroup END


" Plugins
" call plug#begin("~/.vim/plugged")
"   Plug 'APZelos/blamer.nvim'
"   Plug 'luochen1990/rainbow'
"   Plug 'neoclide/coc.nvim', {'branch': 'release'}
"   Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"   Plug 'sainnhe/sonokai'
"   Plug 'scrooloose/nerdtree'
"   Plug 'sheerun/vim-polyglot'
" call plug#end()

" Global Conf
let g:blamer_enabled = 1
let g:blamer_show_in_insert_modes = 0
let g:blamer_delay = 750

" Colors / Theme
if has('termguicolors')
  set termguicolors
endif

let g:rainbow_active = 1
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_transparent_background = 1
colorscheme sonokai
