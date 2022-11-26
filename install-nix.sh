#!/usr/bin/env bash

if [ ! command -v nix-env &> /dev/null ]; then
  echo "installing nix"
  sh <(curl -L https://nixos.org/nix/install)
else
  echo "nix already installed"
fi

echo ""

