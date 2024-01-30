vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

vim.o.number = true
vim.o.list = true
vim.o.listchars = "tab:⍿·,trail:·"
vim.o.cc = 80
vim.o.syntax = 'on'
vim.o.nowrap = true
vim.o.cursorline = true
vim.o.ttyfast = true
vim.o.list = true

vim.o.expandtab = true
vim.o.autoindent = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- lazy nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "HiPhish/rainbow-delimiters.nvim",
  "neovim/nvim-lspconfig",
  "Olical/conjure",
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "clojure", "go", "javascript", "html" },
          sync_install = false,
          -- highlight = { enable = true },
          indent = { enable = true },
      })
    end
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "julienvincent/nvim-paredit",
    config = function()
      require("nvim-paredit").setup()
    end,
  }
})

require("rainbow-delimiters")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, {})

local lsp = require 'lspconfig'
lsp.clojure_lsp.setup{}


vim.cmd.colorscheme "catppuccin-latte"

