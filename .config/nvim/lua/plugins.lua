-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Post-install/update hook with neovim command
  use 'APZelos/blamer.nvim'
  use 'luochen1990/rainbow'
  use { 'neoclide/coc.nvim', branch = 'release' }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
  }
  use 'scrooloose/nerdtree'
  use 'Olical/conjure'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'adelarsq/neofsharp.vim'
end)
