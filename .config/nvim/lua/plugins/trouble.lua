-- [nfnl] Compiled from fnl/plugins/trouble.fnl by https://github.com/Olical/nfnl, do not edit.
local keymaps = {{"<leader>xx", "<cmd>Trouble diagnostics toggle<cr>"}}
return {"folke/trouble.nvim", cmd = "Trouble", enabled = true, keys = keymaps, lazy = false, opts = {}}
