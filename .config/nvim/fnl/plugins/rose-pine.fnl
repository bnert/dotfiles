(import-macros {: tx} :config.macros)

(tx "rose-pine/neovim"
    {:name "rose-pine-dawn"
     :config (fn [] (vim.cmd "colorscheme rose-pine-dawn") nil)})
