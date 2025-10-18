vim.g.mapleader = ";"
vim.g.maplocalleader = ";"
vim.o.path = ".,,**"
vim.o.wildignore = "**/node_modules/,**/__pycache__/"
vim.o.number = true
vim.o.list = true
vim.o.listchars = "tab:\226\141\191 ,trail:\194\183"
vim.o.colorcolumn = "80"
vim.o.syntax = "off"
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

vim.o.termguicolors = true
vim.o.background = "light"

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none', fg = "#1e1e2e" })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
-- 
-- _G.vim.lsp.config(
--   "*",
--   {
--     capabilities = _G.vim.lsp.protocol.make_client_capabilities(),
--     root_markers = {
--       ".git"
--     }
--   }
-- )
-- 
-- -- _G.vim.lsp.enable(
-- --   {
-- --     "clojure",
-- -- --    "fennel",
-- -- --    "go",
-- -- --    "lua",
-- -- --    "python",
-- -- --    "typescript",
-- -- --    "typos",
-- -- --    "zig"
-- --   }
-- -- )
-- 
-- local keymaps = {
--   { "n", "<leader>df", _G.vim.diagnostic.open_float, { desc = "Diagnostics Float" } },
--   { "n", "<leader>dn", _G.vim.diagnostic.get_next, { desc = "Diagnostics: next issue" } },
--   { "n", "<leader>dp", _G.vim.diagnostic.get_prev, { desc = "Diagnostics: prev issue" } },
--   { "n", "<leader>ds", _G.vim.diagnostic.show, { desc = "Diagnostics Show" } },
--   -- { "n", "<leader>ld", _G.vim.lsp.buf.definition, { desc = "LSP Definition" } },
--   -- { "n", "<leader>li", _G.vim.lsp.buf.incoming_calls, { desc = "LSP Incoming" } },
--   -- { "n", "<leader>lh", _G.vim.lsp.buf.hover, { desc = "LSP Hover" } },
--   -- { "n", "<leader>lr", _G.vim.lsp.buf.rename, { desc = "LSP Rename" } },
--   -- { "n", "<leader>lR", _G.vim.lsp.buf.references, { desc = "LSP References" } },
-- }
-- 
-- for _, keymapspec in ipairs(keymaps) do
--   _G.vim.keymap.set(unpack(keymapspec))
-- end
