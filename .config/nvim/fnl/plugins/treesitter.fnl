(import-macros {: tx} :config.macros)

(local trees
  ["clojure"
   "fennel"
   "go"
   "graphql"
   "javascript"
   "html"
   "python"
   "typescript"
   "haskell"
   "zig"])


(fn config []
  (let [configs (require :nvim-treesitter.configs)]
    (configs.setup
      {:ensure_installed trees
       :sync_install     false
       :highlight        {:enable true}
       :indent           {:enable true}})))

(tx "nvim-treesitter/nvim-treesitter"
    {:build  ":TSUpdate"
     :config config})
