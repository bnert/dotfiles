if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Default
set tabstop=2
set shiftwidth=2
set expandtab

" Enabled specific indent rules for different files
" these live in ~/.vim/after/ftplugin/<lang>.vim
autocmd BufNewFile,BufRead *.py setfiletype python
filetype plugin indent on

syntax enable
set number
set cursorline
set listchars=tab:··,trail:~,extends:>,precedes:<,nbsp:␣

call plug#begin('~/.vim/plugged')
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sheerun/vim-polyglot'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

let g:go_version_warning = 0
