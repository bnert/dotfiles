#!/usr/bin/env bash

tld=$(git rev-parse --show-toplevel)
kernel=$(uname -s)

echo "unpacking fonts"
if [[ "Linux" == "${kernel}" ]]; then
  echo "unpacking linux fonts"
  mkdir -p $HOME/.fonts
  cp $tld/fonts/jetbrains-mono/fonts/ttf/* $HOME/.fonts/
  if [ command -v fc-cache &> /dev/null ]; then
    echo "refreshing font cache"
    fc-cache -f -v
  fi
fi

if [[ "Darwin" == "${kernel}" ]]; then
  echo "unpacking macos fonts"
  cp $tld/fonts/jetbrains-mono/fonts/ttf/* $HOME/Library/Fonts/
fi

echo "linking directories: kitty neovim"

[ -d "$HOME/.config/kitty/" ] && [ ! -L "$HOME/.config/kitty" ] && rm -rf $HOME/.config/kitty/ || echo "kitty link exists"
[ ! -L "$HOME/.config/kitty" ] && ln -sf $tld/.config/kitty/ $HOME/.config/kitty

[ -d "$HOME/.config/nvim/" ] && [ ! -L "$HOME/.config/nvim" ] && rm -rf $HOME/.config/nvim/ || echo "nvim link exists"
[ ! -L "$HOME/.config/nvim" ] && ln -sf $tld/.config/nvim/ $HOME/.config/nvim

echo "linking files: tmux.conf"
ln -sf $tld/.tmux.conf $HOME/.tmux.conf

echo "linking bash profile"
echo -e "# added by bnert/dotfiles\n\n"
echo "source $tld/.bash_plugins/git-prompt.sh" >> $HOME/.bashrc
echo "source $tld/.bashrc" >> $HOME/.bashrc
echo "source $tld/ps1.sh" >> $HOME/.bashrc
