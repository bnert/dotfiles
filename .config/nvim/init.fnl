(set vim.g.mapleader ";")
(set vim.g.maplocalleader ";")
(set vim.o.number true)
(set vim.o.list true)
(set vim.o.listchars "tab:⍿·,trail:·")
(set vim.o.colorcolumn "80")
(set vim.o.syntax "on")
(set vim.o.cursorline true)
(set vim.o.ttyfast true)
(set vim.o.list true)
(set vim.o.expandtab true)
(set vim.o.autoindent true)
(set vim.o.tabstop 2)
(set vim.o.softtabstop 2)
(set vim.o.shiftwidth 2)
(set vim.wo.wrap true)

(set vim.diagnostic.config
  {:virtual_lines {:current_line true}})

(require :config.lazy)

(vim.lsp.config "*"
  {:capabilities (vim.lsp.protocol.make_client_capabilities)
   :root_markers [".git"]})

(vim.lsp.enable
  [:clojure
   ; issues: https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/eslint.lua
   ;"eslint
   :fennel
   :lua
   :python
   :tailwindcss
   :typescript
   :typos
   :zls])

{}
