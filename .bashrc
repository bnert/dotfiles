#!/usr/bin/env bash

if [ command -v nvim &> /dev/null ]; then
  export EDITOR="nvim"
else
  export EDITOR="vim"
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gstat="git status"
alias gpush="git push"
alias gcomm="git commit"
alias gpull="git pull"

# Swap caps & escape
if [[ "Linux" == "$(uname -s)" ]]; then
  setxkbmap -option caps:swapescape
fi


# Environment
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
  source $HOME/.nix-profile/etc/profile.d/nix.sh
fi

