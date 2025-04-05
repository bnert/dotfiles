(import-macros {: tx} :config.macros)

(local opts
  {:ensure_installed
   ["clj-kondo"
    "clojure-lsp"
    "eslint-lsp"
    "fennel-ls"
    "haskell-language-server"
    "lua-language-server"
    "prettier"
    "pyright"
    "tailwindcss-language-server"
    "terraform-ls"
    "typescript-language-server"
    "typos-lsp"
    "zls"]
   :max_concurrent_installers 10})

(fn config [_ opts]
  (let [mason (require "mason")]
    (mason.setup opts)
    (vim.api.nvim_create_user_command "MasonInstallAll"
      (fn []
        (when (and opts.ensure_installed (< 0 (length opts.ensure_installed)))
          (vim.cmd "Mason")
          (let [mr (require :mason-registry)]
            (mr.refresh
              (fn []
                (each [_ tool (ipairs opts.ensure_installed)]
                  (let [pkg (mr.get_package tool)]
                    (when (not (pkg:is_installed))
                      (pkg:install))))))))
        (set vim.g.mason_binaries_list opts.ensure_installed))
      {}))
  nil)

(tx "williamboman/mason.nvim"
  {:cmd     ["Mason" "MasonInstall" "MasonInstallAll" "MasonUpdate"]
   :config  config
   :enabled true
   :opts    opts})
