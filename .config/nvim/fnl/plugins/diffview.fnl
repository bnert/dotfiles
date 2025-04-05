(import-macros {: tx} :config.macros)

(local keymaps
  [["<leader>dvm" "<cmd>DiffviewOpen origin/main...HEAD<cr>"]])

(tx "sindrets/diffview.nvim"
    {:opts {:use_icons true}
     :keys keymaps})
