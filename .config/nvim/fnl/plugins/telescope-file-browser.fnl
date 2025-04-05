(import-macros {: tx} :config.macros)

(fn load-extension []
  (let [telescope (require :telescope)]
    (telescope.load_extension "file_browser")))

(fn browse-file []
  (let [telescope (require :telescope)
        action    (-> telescope (. :extensions :file_browser :file_browser))]
    (action)))


(local keymaps
  [["<leader>fp" browse-file]])

(tx "nvim-telescope/telescope-file-browser.nvim"
    {:config load-extension
     :keys   keymaps})
