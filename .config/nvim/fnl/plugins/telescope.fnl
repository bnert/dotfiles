(import-macros {: tx} :config.macros)

(fn thunk [module func]
  (fn []
    (let [m (require module)]
      (: m func))))

(local keymaps
  [["<leader>ff" (thunk :telescope.builtin :find_files)]
   ["<leader>fg" (thunk :telescope.builtin :live_grep)]
   ["<leader>fb" (thunk :telescope.builtin :buffers)]
   ["<leader>fr" (thunk :telescope.builtin :lsp_references)]
   ["<leader>fd" (thunk :telescope.builtin :lsp_definitions)]
   ["<leader>fi" (thunk :telescope.builtin :lsp_implementations)]])

(tx "nvim-telescope/telescope.nvim"
    {:dependencies ["nvim-lua/plenary.nvim"]
     :keys         keymaps})
