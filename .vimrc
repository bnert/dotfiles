" This way, can copy dot file and have plugins work
" out of the box
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'sheerun/vim-polyglot'
Plug 'christoomey/vim-tmux-navigator'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Standard vim settings
set nocompatible
set number
set autoindent
set tabstop=2 " The width of a tab
set sw=2 " Can also be: sw=2
set sts=2 "
set expandtab " Sets to use spaces instead of tabs. Can also be: et

" To see which characters are on screen
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,nbsp:␣
set list

syntax enable

" Lang specific confs
" let g:jsx_ext_required = 0
let g:go_version_warning = 0

" Vue.js
autocmd FileType vue syntax sync fromstart
