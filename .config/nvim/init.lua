_G.vim.g.mapleader = ";"
_G.vim.g.maplocalleader = ";"
_G.vim.o.path = ".,,**"
_G.vim.o.wildignore = "**/node_modules/,**/__pycache__/"
_G.vim.o.number = true
_G.vim.o.list = true
_G.vim.o.listchars = "tab:\226\141\191 ,trail:\194\183"
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

_G.vim.o.termguicolors = true
_G.vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
_G.vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
_G.vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
_G.vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
_G.vim.o.background = "light"

require("config.lazy")

_G.vim.lsp.config(
  "*",
  {
    capabilities = _G.vim.lsp.protocol.make_client_capabilities(),
    root_markers = {
      ".git"
    }
  }
)

_G.vim.lsp.enable(
  {
    "clojure",
    "fennel",
    "go",
    "lua",
    "python",
    "typescript",
    "typos",
    "zig"
  }
)

local keymaps = {
  { "n", "<leader>df", _G.vim.diagnostic.open_float, { desc = "Diagnostics Float" } },
  { "n", "<leader>dn", _G.vim.diagnostic.get_next, { desc = "Diagnostics: next issue" } },
  { "n", "<leader>dp", _G.vim.diagnostic.get_prev, { desc = "Diagnostics: prev issue" } },
  { "n", "<leader>ds", _G.vim.diagnostic.show, { desc = "Diagnostics Show" } },
  { "n", "<leader>ld", _G.vim.lsp.buf.definition, { desc = "LSP Definition" } },
  { "n", "<leader>li", _G.vim.lsp.buf.incoming_calls, { desc = "LSP Incoming" } },
  { "n", "<leader>lh", _G.vim.lsp.buf.hover, { desc = "LSP Hover" } },
  { "n", "<leader>lr", _G.vim.lsp.buf.rename, { desc = "LSP Rename" } },
  { "n", "<leader>lR", _G.vim.lsp.buf.references, { desc = "LSP References" } },
}

for _, keymapspec in ipairs(keymaps) do
  _G.vim.keymap.set(unpack(keymapspec))
end

