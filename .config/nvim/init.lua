-- [nfnl] init.fnl
_G.vim.g.mapleader = ";"
_G.vim.g.maplocalleader = ";"
_G.vim.o.number = true
_G.vim.o.list = true
_G.vim.o.listchars = "tab:\226\141\191\194\183,trail:\194\183"
_G.vim.o.colorcolumn = "80"
_G.vim.o.syntax = "on"
_G.vim.o.cursorline = true
_G.vim.o.ttyfast = true
_G.vim.o.list = true
_G.vim.o.expandtab = true
_G.vim.o.autoindent = true
_G.vim.o.tabstop = 2
_G.vim.o.softtabstop = 2
_G.vim.o.shiftwidth = 2
_G.vim.wo.wrap = true
_G.vim.diagnostic.config = {virtual_lines = {current_line = true}}
require("config.lazy")
_G.vim.lsp.config("*", {capabilities = _G.vim.lsp.protocol.make_client_capabilities(), root_markers = {".git"}})
_G.vim.lsp.enable({"clojure", "fennel", "go", "lua", "python", "tailwindcss", "typescript", "typos", "zig"})
_G.vim.keymap.set("n", "<leader>lar", _G.vim.lsp.buf.rename, {desc = "LSP Rename"})
_G.vim.keymap.set("n", "<leader>lah", _G.vim.lsp.buf.hover, {desc = "LSP Hover"})
_G.vim.keymap.set("n", "<leader>df", _G.vim.diagnostic.open_float, {desc = "Diagnostics Float"})
_G.vim.keymap.set("n", "<leader>dn", _G.vim.diagnostic.get_next, {desc = "Diagnostics: next issue"})
_G.vim.keymap.set("n", "<leader>dp", _G.vim.diagnostic.get_prev, {desc = "Diagnostics: prev issue"})
_G.vim.keymap.set("n", "<leader>ds", _G.vim.diagnostic.show, {desc = "Diagnostics Show"})
return {}
