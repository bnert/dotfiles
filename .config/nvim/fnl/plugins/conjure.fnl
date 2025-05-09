(import-macros {: tx} :config.macros)

(macro conjure-eval [& body]
  `(.. "<cmd>ConjureEval "
      ,(unpack body)
      "<cr>"))

(local clj-reload
  ["<leader>rl"
   (.. "<cmd>ConjureEval"
       "(try (apply (requiring-resolve 'clj-reload.core/reload) []) (catch Exception e (println \"unable to reload\")))"
       "<cr>")])

(local repl-refresh
  ["<leader>rr"
   (.. "<cmd>ConjureEval "
       "(try (apply (requiring-resolve 'clojure.tools.namespace.repl/refresh) []) "
       "(catch Exception e (println \"Unable to refresh\" e)"
       "<cr>")])

(fn noop [])

(set _G.vim.g.conjure#mapping#doc_word "K")
; (set vim.g.conjure#filetype#fennel "conjure.client.fennel.nfnl")
; (set vim.g.conjure#client#sql#stdio#command "psql -h localhost -U blogger -d postgres")

(tx "Olical/conjure"
  {:opts   {}
   :dependencies ["Olical/nfnl"]
   :lazy   false
   :config noop
   :init   noop
   :keys   [clj-reload repl-refresh]})

