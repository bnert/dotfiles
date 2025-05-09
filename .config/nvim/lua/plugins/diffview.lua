-- [nfnl] fnl/plugins/diffview.fnl
local keymaps = {{"<leader>dvm", "<cmd>DiffviewOpen origin/main...HEAD<cr>"}}
return {"sindrets/diffview.nvim", keys = keymaps, opts = {use_icons = true}}
