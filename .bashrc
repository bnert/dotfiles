#!/usr/bin/env bash

export EDITOR="nvim"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

if [[ "Linux" == "$(uname -s)" ]]; then
  setxkbmap -option caps:swapescape
fi

# Environment

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
  source $HOME/.nix-profile/etc/profile.d/nix.sh
fi

