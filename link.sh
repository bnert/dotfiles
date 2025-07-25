#!/usr/bin/env bash

tld=$(git rev-parse --show-toplevel)
kernel=$(uname -s)

echo "unpacking fonts"
if [[ "Linux" == "${kernel}" ]]; then
  echo "unpacking linux fonts"
  mkdir -p $HOME/.fonts
  cp $tld/fonts/atkinson-mono/static/* $HOME/.fonts/
  if [ command -v fc-cache &> /dev/null ]; then
    echo "refreshing font cache"
    fc-cache -f -v
  fi

  if [[ $TERM == "xterm-kitty" ]]; then
    mkdir -p $HOME/.terminfo/x/
    if [[ -f "/usr/share/terminfo/x/xterm-kitty" && ! -L $HOME/.terminfo/x/xterm-kitty ]]; then
      echo "setting up kitty terminfo"
      ln -s /usr/share/terminfo/x/xterm-kitty $HOME/.terminfo/x/xterm-kitty
    else
      echo "kitty terminfo already setup"
    fi
  fi
fi

if [[ "Darwin" == "${kernel}" ]]; then
  echo "unpacking macos fonts"
  cp $tld/fonts/atkinson-mono/static/* $HOME/Library/Fonts/
fi

echo "linking directories: ghostty kitty neovim .clojure"

## ghostty config
[ -d "$HOME/.config/ghostty/" ] && [ ! -L "$HOME/.config/ghostty" ] && rm -rf $HOME/.config/ghostty/ || echo "ghostty link exists"
[ ! -L "$HOME/.config/ghostty" ] && ln -sf $tld/.config/ghostty/ $HOME/.config/ghostty

## neovim config
[ -d "$HOME/.config/nvim/" ] && [ ! -L "$HOME/.config/nvim" ] && rm -rf $HOME/.config/nvim/ || echo "nvim link exists"
[ ! -L "$HOME/.config/nvim" ] && ln -sf $tld/.config/nvim/ $HOME/.config/nvim

## neovim clojure lsp
[ -d "$HOME/.config/clojure-lsp" ] && [ ! -L "$HOME/.config/clojure-lsp" ] && rm -rf $HOME/.config/clojure-lsp || echo "clojure-lsp link exists"
[ ! -L "$HOME/.config/clojure-lsp" ] && ln -sf $tld/.config/clojure-lsp/ $HOME/.config/clojure-lsp

## .clojure directory
[ -d "$HOME/.clojure" ] && [ ! -L "$HOME/.clojure" ] && rm -rf $HOME/.clojure || echo ".clojure link exists"
[ ! -L "$HOME/.clojure" ] && ln -sf $tld/.clojure $HOME/.clojure

echo "linking bash profile"

echo -e "# added by bnert/dotfiles\n" >> $HOME/.profile
echo "source $tld/.bash_plugins/git-prompt.sh" >> $HOME/.profile
echo "source $tld/.bashrc" >> $HOME/.profile
echo "source $tld/ps1.sh" >> $HOME/.profile

