-- [nfnl] Compiled from fnl/plugins/diffview.fnl by https://github.com/Olical/nfnl, do not edit.
local keymaps = {{"<leader>dvm", "<cmd>DiffviewOpen origin/main...HEAD<cr>"}}
return {"sindrets/diffview.nvim", keys = keymaps, opts = {use_icons = true}}
