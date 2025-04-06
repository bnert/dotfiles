(import-macros {: tx} :config.macros)

(fn thunk [module func]
  (fn []
    (let [m (require module)]
      (: m func))))

(local keymaps
  [["<leader>tf" (thunk :telescope.builtin :find_files)]
   ["<leader>tg" (thunk :telescope.builtin :live_grep)]
   ["<leader>tb" (thunk :telescope.builtin :buffers)]
   ["<leader>td" (thunk :telescope.builtin :diagnostics)]
   ["<leader>lr" (thunk :telescope.builtin :lsp_references)]
   ["<leader>ld" (thunk :telescope.builtin :lsp_definitions)]
   ["<leader>lI" (thunk :telescope.builtin :lsp_implementations)]
   ["<leader>lt" (thunk :telescope.builtin :lsp_type_definitions)]
   ["<leader>li" (thunk :telescope.builtin :lsp_incoming_calls)]
   ["<leader>lo" (thunk :telescope.builtin :lsp_outgoing_calls)]])

(tx "nvim-telescope/telescope.nvim"
    {:dependencies ["nvim-lua/plenary.nvim"]
     :keys         keymaps})
