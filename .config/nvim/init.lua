-- [nfnl] Compiled from init.fnl by https://github.com/Olical/nfnl, do not edit.
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"
vim.o.number = true
vim.o.list = true
vim.o.listchars = "tab:\226\141\191\194\183,trail:\194\183"
vim.o.colorcolumn = "80"
vim.o.syntax = "on"
vim.o.cursorline = true
vim.o.ttyfast = true
vim.o.list = true
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.wo.wrap = true
vim.diagnostic.config = {virtual_lines = {current_line = true}}
require("config.lazy")
vim.lsp.config("*", {capabilities = vim.lsp.protocol.make_client_capabilities(), root_markers = {".git"}})
vim.lsp.enable({"clojure", "fennel", "lua", "python", "tailwindcss", "typescript", "typos", "zls"})
vim.keymap.set("n", "<leader>lar", vim.lsp.buf.rename, {desc = "LSP Rename"})
return {}
